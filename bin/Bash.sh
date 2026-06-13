gcloud auth configure-docker \
    europe-docker.pkg.dev
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
brew install --cask google-cloud-sdk
gcloud auth configure-docker europe-docker.pkg.dev
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable run.googleapis.com
gcloud artifacts repositories create my-repo \
  --repository-format=docker \
  --location=europe \
  --description="Docker repo"
  gcloud artifacts repositories list
  gcloud auth configure-docker europe-docker.pkg.dev
~/.docker/config.json
docker tag my-app europe-docker.pkg.dev/my-project/my-repo/my-app:v1
docker push europe-docker.pkg.dev/my-project/my-repo/my-app:v1
docker pull europe-docker.pkg.dev/my-project/my-repo/my-app:v1
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="user:kubulee.kl@gmail.com" \
  --role="roles/artifactregistry.writer"
docker build -t my-app .

gcloud run deploy my-app \
  --image europe-docker.pkg.dev/my-project/my-repo/my-app:v1 \
  --platform managed \
  --region europe-west1 \
  --allow-unauthenticated
  
