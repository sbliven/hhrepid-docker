HHrepID Docker
==============
This creates a docker container for
[HHrepID](https://toolkit.tuebingen.mpg.de/#/tools/hhrepid), a tool by Andreas
Beigert and Johannes Soding for de novo protein repeat detection. Using the
docker container allows HHrepID to be run on Mac or Windows in addition to
linux.

HHrepID is licensed under the [Attribution-NonCommercial-2.0
license](http://creativecommons.org/licenses/by-nc/2.0/) from Creative Commons.


Running
-------

The easiest way to run hhrepid with docker is using the wrapper script
`hhrepid_docker.sh`,provided on
[github](https://github.com/sbliven/hhrepid-docker). Since docker runs hhrepid
inside a container, input and output files must be bound to locations inside
the container. This binding is handled by the script, making it possible to use
it just like the linux hhrepid command.

    ./hhrepid_docker.sh -h

For simple commands like `-h` that don't require I/O, the container can be run
directly:

    docker run --rm blivens/hhrepid -h

For information on the hhrepid command, see the [HHrepID
Readme](ftp://ftp.tuebingen.mpg.de/pub/protevo/HHrepID/README). Note that the
data files are not provided and should be [downloaded
sparately](ftp://ftp.tuebingen.mpg.de/pub/protevo/HHrepID).

Building
--------

The image is available on
[docker-hub](https://hub.docker.com/r/blivens/hhrepid/). This  and can be downloaded
with:

    docker pull blivens/hhrepid

It can also be built locally with

    docker build -t blivens/hhrepid .


License
-------

The Dockerfile and wrapper scripts were written by Spencer Bliven (2018).
They are released into the public domain.
http://creativecommons.org/publicdomain/zero/1.0/

HHrepID is Copyright Andreas Biegert (2007).
The HHrepID software package is distributed under the terms of the
[Attribution-NonCommercial-2.0 license from Creative Commons](http://creativecommons.org/licenses/by-nc/2.0/).
See [full license terms](ftp://ftp.tuebingen.mpg.de/pub/protevo/HHrepID/LICENSE)

Please cite:

> Biegert A, Soding J. De novo identification of highly diverged protein
> repeats by probabilistic consistency. Bioinformatics. 2008 Mar 15;24(6):807-14


