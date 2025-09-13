# Setup

These are instructions for setting up the QMK firmware and building and flashing the firmware for my keyboard (currently a Moonlander MK1).

1. Initialize and/or update submodules in this repo to pull the `qmk_firmware` repo.  
1. Install `qmk`. Easily done with `uv`: `uv tool install qmk`. This makes it available as a system wide uv managed tool.

Now we need to run the QMK setup script:

1. From the `kb` directory run `qmk setup -H $PWD/qmk_firmware`.
1. The setup script expects to clone the repo by default so it will need input if it has already been cloned through the submodule setup. Choose the option to keep the existing repo.
1. Next you'll be asked about the QMK home directory, select yes.
1. Install any dependencies, if required.
 
In my first run through that was all that was necessary for the setup script. I imagine future invocations might require more or different steps depending on factors I'm not yet aware of.

[More info in the qmk docs](https://docs.qmk.fm/newbs_getting_started).
