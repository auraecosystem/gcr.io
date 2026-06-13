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
Troubleshooting info:
  Principal: sandraisom0@gmail.com
  Resource: web4-426302
  Troubleshooting URL: console.cloud.google.com/iam-admin/troubleshooter/summary;permissions=resourcemanager.projects.get;token=AbColwY49yytnnLt8ki0hua1XX8oCXmaQP6olzW5OjZoJdkozv8T3HxZO97qJJHk2rYCwSVe3ZXiJmm8zyKc88joz3xb8tvrM1HrT1oq4ThPXjHIlLH8pe5SRAkLKM4_sC1okop6tq7t38K6OrikHlnsTzLzQG2jCm676-w_MYjajg?utm_campaign=error_page&utm_source=cloud_console

Missing or blocked permissions:
  resourcemanager.projects.get
docker pull dev-image
docker tag dev-image staging-image
docker push staging-image
