#! /usr/bin/env python

import psutil
import signal
import subprocess
import sys
import threading
import time

megabytes = lambda n: n / (1024 ** 2)

class ProcessStats:
    def __init__(self, *args, out=None):
        stdout = out if out else sys.stdout
        stderr = out if out else sys.stderr

        self.proc = subprocess.Popen(args, stdout=out, stderr=out)

        rc = self.proc.poll()
        if rc:
            raise Exception(args + f' returned immediately with {rc}')

        self.max_rss = 0

        self.monitor_thread = threading.Thread(target=self._monitor)
        self.monitor_thread.start()

    def _monitor(self):
        last_print = 0

        proc_util = psutil.Process(self.proc.pid)

        rc = None

        while rc is None:
            rss = megabytes( proc_util.memory_full_info().rss )

            if (time.time() - last_print) > 60:
                #print(f'RSS = {rss} MB')
                last_print = time.time()

            self.max_rss = max(self.max_rss, rss)

            time.sleep(1)

            rc = self.proc.poll()

    def signal(self, signum):
        self.proc.send_signal(signum)

    def wait(self):
        self.proc.wait()

    def close(self):
        self.proc.terminate()
        self.monitor_thread.join()


def run_and_get_max_rss(*args):
    proc = ProcessStats(*args)

    def sig_handler(signum, frame):
        proc.signal(signum)

    signal.signal(signal.SIGABRT, sig_handler)
    signal.signal(signal.SIGINT, sig_handler)
    signal.signal(signal.SIGTERM, sig_handler)

    proc.wait()

    return proc.max_rss

def main(*args):
    max_rss = run_and_get_max_rss(*args)
    print(f'Max RSS = {max_rss} MB')

if __name__ == '__main__':
    main(*sys.argv[1:])

