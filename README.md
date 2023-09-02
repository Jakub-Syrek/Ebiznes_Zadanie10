# Ebiznes_Zadanie10

docker build -t backend-docker .
docker run -p 3001:3001 backend-docker

aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 289272766788.dkr.ecr.eu-central-1.amazonaws.com

aws ecr create-repository --repository-name backend-docker --region eu-central-1
docker tag backend-docker:latest 289272766788.dkr.ecr.eu-central-1.amazonaws.com/backend-docker:latest
docker push 289272766788.dkr.ecr.eu-central-1.amazonaws.com/backend-docker:latest

aws ecs create-cluster --cluster-name my-cluster
aws ecs register-task-definition --cli-input-json file://ecs-task-definition.json
aws ecs create-service --cluster my-cluster --service-name my-service1 --task-definition my-task-definition --desired-count 1 --launch-type EC2
