push-ecr:
	aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 401913772240.dkr.ecr.us-east-2.amazonaws.com
	docker build -t test-app-carlos --platform linux/amd64 .
	docker tag test-app-carlos:latest 401913772240.dkr.ecr.us-east-2.amazonaws.com/test-app-carlos:latest
	docker push 401913772240.dkr.ecr.us-east-2.amazonaws.com/test-app-carlos:latest

build-local:
	docker build -t test-app-carlos .