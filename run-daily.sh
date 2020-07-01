#!/usr/bin/env bash

cd /home/aoe/mask-facades && ./run.sh 2 || true &
cd /home/aoe/street-view-screenshots && ./run.sh 2 || true &

wait

echo "Done!"
