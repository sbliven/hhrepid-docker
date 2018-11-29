HHrepID Docker
==============
This creates a docker container for HHrepID. This allows HHrepID to be run on
Mac or Windows.

HHrepID is licensed under the Attribution-NonCommercial-2.0 license from
Creative Commons (http://creativecommons.org/licenses/by-nc/2.0/)

Building
--------

The image is available on
[docker-hub](https://hub.docker.com/r/blivens/hhrepid/) and can be accessed


    docker pull blivens/hhrepid

It can also be built locally with

    docker build -t hhrepid .


Running
-------

A wrapper script is provided called `hhrepid_docker.sh`. Since docker runs
inside a container, input and output files must be bound to locations inside
the container. This binding is handled by the script, making it possible to
use it just like the linux hhrepid command.

For simple commands like `-h` that don't require I/O, the container can be run
directly:

    docker run --rm hhrepid -h

License
-------

The Dockerfile and wrapper scripts were written by Spencer Bliven (2018).
They are released into the public domain.
http://creativecommons.org/publicdomain/zero/1.0/

HHrepID is Copyright Andreas Biegert (2007).
The HHrepID software package is distributed under the terms of the
[Attribution-NonCommercial-2.0 license from Creative Commons]
(http://creativecommons.org/licenses/by-nc/2.0/).
See [full license terms](ftp://ftp.tuebingen.mpg.de/pub/protevo/HHrepID/LICENSE)

Please cite:

> Biegert A, Soding J. De novo identification of highly diverged protein
> repeats by probabilistic consistency. Bioinformatics. 2008 Mar 15;24(6):807-14


