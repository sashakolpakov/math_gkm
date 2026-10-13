#!/bin/sh
# Machine-authored activation script. NOT executed by the builder.
# Supervisor activates only after independent implementation review.
set -eu
cd /Users/sasha/math_gkm
export GIT_CONFIG_NOSYSTEM=1
export GIT_CONFIG_GLOBAL=/dev/null
export TMPDIR=/Users/sasha/math_gkm/.scratch
/opt/homebrew/bin/python3 -m machinery.controller init --goal markov-smoke --workers 2 --worker-seconds 120
exec /opt/homebrew/bin/python3 -m machinery.controller run --goal markov-smoke
