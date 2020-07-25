# run-daily

Google Cloud Run function to automatically:

  - Import POIs from CSV
  - Take Street View screenshots
  - Mask images

First, set project configuration using Google Cloud CLI:

    gcloud config set project streetswipe-aoe
    gcloud config set run/region europe-west4

Build the Dockerfile:

    docker build -t eu.gcr.io/streetswipe-aoe/run-daily .

To build the Dockerfile from scratch, use the `--no-cache` option:

    docker build --no-cache -t eu.gcr.io/streetswipe-aoe/run-daily .

Push and deploy the container to Google Cloud Run:

    docker push eu.gcr.io/streetswipe-aoe/run-daily
    gcloud run deploy --image eu.gcr.io/streetswipe-aoe/run-daily --platform managed --memory 2Gi

To run bash in the Docker container locally, run:

    docker run -it eu.gcr.io/streetswipe-aoe/run-daily bash
