git remote add origin https://github.com/auraecosystem/gcr.io.git
git branch -M main
git push -u origin main
gcloud artifacts repositories create my-repo \
  --repository-format=docker \
  --location=europe \
  --description="Docker images repo"
  docker pull staging-image
docker tag staging-image prod-image:v1.2.0
docker push prod-image:v1.2.0

docker pull dev-image
docker tag dev-image staging-image
docker push staging-image
