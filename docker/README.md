# docker images in use

## Resume App
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t 190928636648.dkr.ecr.us-west-2.amazonaws.com/resume:latest . --push
```

## snake game
I used to love the game Snake, so I found a cool docker image which runs it.
https://github.com/kornpow/CycleSnake

Command to create a multi-arch build of the project, and push to a public AWS ECR repo.
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t public.ecr.aws/i9m8a4n0/cycle-snake:latest . --push
```


## AWS Kubectl
This is a simple docker container which has `aws-cli` and `kubectl` installed.
```bash
docker buildx build --platform linux/arm64 -t public.ecr.aws/i9m8a4n0/aws-kubectl:latest ecr-login/ --push
```

