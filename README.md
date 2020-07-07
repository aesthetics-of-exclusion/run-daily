# run-daily

Google Cloud Run function to automatically:

  - Import POIs from CSV
  - Take Street View screenshots
  - Mask images

To deploy the function, run:

    gcloud config set project streetswipe-aoe
    gcloud config set run/region europe-west4

    docker build -t eu.gcr.io/streetswipe-aoe/run-daily .
    docker push eu.gcr.io/streetswipe-aoe/run-daily
    gcloud run deploy --image eu.gcr.io/streetswipe-aoe/run-daily --platform managed --memory 2Gi

To run bash in the Docker container locally, run:

    docker run -it eu.gcr.io/streetswipe-aoe/run-daily bash
