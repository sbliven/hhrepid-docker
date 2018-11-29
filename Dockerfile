# Created by Spencer Bliven, 2018
# This script is released into the public domain.
# http://creativecommons.org/publicdomain/zero/1.0/
#
# HHrepID is Copyright Andreas Biegert (2007).
# The HHrepID software package is distributed under the terms of the
# Attribution-NonCommercial-2.0 license from Creative Commons
# (http://creativecommons.org/licenses/by-nc/2.0/).
#
# Please cite:
#
# Biegert A, Soding J. De novo identification of highly diverged protein
# repeats by probabilistic consistency. Bioinformatics. 2008 Mar 15;24(6):807-14



FROM debian:stable-slim

WORKDIR /app

ADD http://ftp.tuebingen.mpg.de/pub/protevo/HHrepID/hhrepid_64 /usr/local/bin/hhrepid_64
RUN chmod +x /usr/local/bin/hhrepid_64

ENTRYPOINT ["/usr/local/bin/hhrepid_64"]
