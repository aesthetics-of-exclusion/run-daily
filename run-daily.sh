#!/usr/bin/env bash

cd /home/aoe/faillisementen && ./run.sh || true &
cd /home/aoe/mask-facades && ./run.sh 5 || true &
cd /home/aoe/street-view-screenshots && ./run.sh 5 || true &

wait

echo "Done!"
