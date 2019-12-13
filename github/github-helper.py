import os
import sys
import argparse
import csv
import collections
import github
import requests

Issue = collections.namedtuple('Issue', ('repo_name', 'project', 'title_or_id', 'description'))

def get_token():
    if os.path.exists('.token'):
        return open('.token', 'r').read()
    return None

def get_from_paginated_list(items, func):
    for i in items:
        if func(i):
            return i
    return None

def list_projects(org):
    projs = org.get_projects()
    for p in projs:
        print(f'{p.number} | {p.name}')

def add_or_get_issue_in_repo(org, issue : Issue):
    repo = org.get_repo(issue.repo_name)

    if repo is None:
        print(f'Unable to find repository {issue.repo_name} for {issue.title}')
        return None

    # Check if the issue title is just a number, in which case let's use that to grab
    # the issue by the Id

    is_id = True
    try:
        issue_id = int(issue.title_or_id)
    except ValueError:
        is_id = False

    ghissue = None

    if is_id:
        ghissue = repo.get_issue(issue_id)

        if ghissue is None:
            print(f'Unable to find issue {issue_id} in {issue.repo_name}')
    else:
        # Issue was defined by a title, let's see if there's already an issue
        # with a matching title
        all_issues = repo.get_issues(state='open')

        for i in all_issues:
            if i.title == issue.title_or_id:
                ghissue = i
                break

        if ghissue is None:
            ghissue = repo.create_issue(
                issue.title_or_id,
                issue.description
            )

    return ghissue

def get_project(org, project):
    # If the project contains a slash then it is a repo name and project Id
    if '/' in project:
        repo_name, project_id = project.split('/')
        project_id = int(project_id)

        ghrepo = org.get_repo(repo_name)
        ghprojs = ghrepo.get_projects(state='open')

    else:
        project_id = int(project)

        ghprojs = org.get_projects(state='open')

    for p in ghprojs:
        if p.number == project_id:
            return p

    return None

def add_issue_to_project_column(
        ghproj : github.Project.Project, column_name : str, ghissue : github.Issue.Issue
    ):
    # First check if a card already exists for this issue
    cols = ghproj.get_columns()
    for c in cols:
        cards = c.get_cards()
        for card in cards:
            content = card.get_content()
            if isinstance(content, github.Issue.Issue):
                if content.number == ghissue.number:
                    if c.name == column_name: # Nothing to do because it's already in the correct column
                        return card
                    else:
                        print(f'Issue {ghissue.number} is in the project board already, but in column "{c.name}"')
                        return card

    # Find the column with the requested name
    col = get_from_paginated_list(cols, lambda c: c.name == column_name)

    if col is None:
        print(f'Project {ghproj.name} does not have a column named {column_name}')
        return None

    card = col.create_card(
        content_id=ghissue.id,
        content_type='Issue'
    )

    # If we had to create a new one move the card to the bottom.
    # By default it gets added to the top and that's usually not what we want.
    # This doesn't appear to be implemented in PyGitHub yet so this is a
    # semi-manual call. We piggy back off of the PyGitHub Requester object
    # to help.
    card_pos = {
        'position': 'bottom',
        'column_id': col.id
    }

    resp = card._requester.requestJson(
        'POST',
        f'/projects/columns/cards/{card.id}/moves',
        input=card_pos,
        headers={
            'Accept': 'application/vnd.github.inertia-preview+json'
        }
    )

    return card

def create_issues(org, issues_csv):
    issues = []
    with open(issues_csv, 'r') as fcsv:
        rdr = csv.reader(fcsv, delimiter='|')
        for row in rdr:
            repo, project, title, desc = row
            desc = desc.replace('\\n', '\n')
            issues.append(Issue(repo, project, title, desc))

    print(f'Attempting to add {len(issues)} issues')

    for issue in issues:
        ghissue = add_or_get_issue_in_repo(org, issue)

        print(f'Issue {ghissue.number}: {ghissue.title}')

        # Now get the project this issue needs to be added to
        ghproj = get_project(org, issue.project)

        if ghproj is None:
            print(f'Could not find project {issue.project}')
            continue

        card = add_issue_to_project_column(ghproj, 'To do', ghissue)        

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--list-projects', action='store_true')
    parser.add_argument('--create-issues', action='store', metavar='CSV')
    args = parser.parse_args()

    gh = github.Github(get_token())
    user = gh.get_user()

    orgs = user.get_orgs()
    teton : github.Organization.Organization = \
        get_from_paginated_list(orgs, lambda o: o.login == 'tetonsim')

    if args.list_projects:
        list_projects(teton)
    elif args.create_issues:
        create_issues(teton, args.create_issues)

if __name__ == '__main__':
    main()
