# docker images in use

## snake game
I used to love the game Snake, so I found a cool docker image which runs it.
https://github.com/kornpow/CycleSnake

Command to create a multi-arch build of the project, and push to a public AWS ECR repo.
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t public.ecr.aws/i9m8a4n0/cycle-snake:latest  . --push
```