# Composite-Actions: Build and Push Docker Image

## Overview
This action automates the process of building and pushing a Docker image to an Amazon Elastic Container Registry (ECR) repository. It facilitates seamless integration into your CI/CD pipelines.

## Inputs
- `ENV`: Environment variables.
- `AWS_ROLE`: AWS role for authentication.
- `AWS_REGION`: AWS region where the repository is located.
- `PROJECT_PREFIX`: Prefix for the project.
- `ECR_REPOSITORY`: Name of the ECR repository.
- `COMMON_TOKEN`: Common token for authentication.

## Outputs
- `ECR_REPO`: ECR repository.
- `ECR_REGISTRY`: ECR registry.
- `IMAGE_TAG`: Tag for the Docker image.

## Usage
```yaml
on: [push]

jobs:
  build-and-push-image-job:
    runs-on: ubuntu-latest
    name: Build and Push Docker Image
    permissions:
      id-token: write
      pull-requests: write
      contents: read
    needs: prepare-env-job
    env:
      ENV: ${{ needs.prepare-env-job.outputs.ENV }}
      AWS_ROLE: ${{ needs.prepare-env-job.outputs.AWS_ROLE }}
      AWS_REGION: ${{ needs.prepare-env-job.outputs.AWS_REGION }}
      PROJECT_PREFIX: ${{ needs.prepare-env-job.outputs.PROJECT_PREFIX }}
      ECR_REPOSITORY: ${{ needs.prepare-env-job.outputs.ECR_REPOSITORY }}

    steps:
      - id: build_and_push_docker_image
        uses: devikrishnamk0123/composite-actions-trial/build-and-push-docker-image@dev
        with:
          ENV: ${{ env.ENV }}
          AWS_ROLE: ${{ secrets[env.AWS_ROLE] }}
          AWS_REGION: ${{ env.AWS_REGION }}
          PROJECT_PREFIX: ${{ env.PROJECT_PREFIX }}
          ECR_REPOSITORY: ${{ env.PROJECT_PREFIX }}
          COMMON_TOKEN: ${{ secrets.COMMON_TOKEN }}
