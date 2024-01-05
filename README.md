## Vitual Macine Tweaks
I very often create VMs for testing stuff.
What I had been doing is a netinstall of debian (or equivalent with respect to other distros) and
installing cinnamon-core package which gets me a small & simple GUI frontend in which I can test things.
But the thing with cinnamon or any other Desktop Environment (DE) is that they are BIG.
We are not talking about megabytes but size as high as couple GigaBytes.
That is wasted space that I could use for other things.
So this script is a replacement for that.
It installs IceWM - a Window Manager (WM) - as well as some basic utilities like git, a browser, etc.

## Installation

Execute install.sh as **normal user** from a terminal:

```bash
 git clone https://github.com/shreyas-a-s/virt-tweaks
 cd virt-tweaks/
 ./install.sh
```

For those who would like a single-line command:
```bash
 git clone https://github.com/shreyas-a-s/virt-tweaks && cd virt-tweaks/ && ./install.sh
```
