# Kodak ScanMate i940 Docker container

Unfortunately, the driver for the Kodak ScanMate i940 will crash on
Debian 13 (trixie).

As a workaround, I'm using this Docker container to run `scanimage` in
Debian 12. I'm only using `scanimage` on the command line with the
batch (`-b`) option, so this is very specific to my use-case. It's a
crutch, but it works.

* Build the container by doing

   `docker build -t scanimage .`

* Replace regular calls to 'scanimage' with this thing here

   `docker run  -it --privileged -w /data -v "$(pwd):/data"  -u $(id -u):$(id -g) --rm scanimage`

  You can simply put all necessary options to `scanimage` after
  this. (Yes, I'm aware using 'privileged' is considered bad. I'm sure
  there are better solutions, but it works...)

