# Composite-Action: Prepare Environment

## Inputs
- `environment`: The environment.
- `branch`: The branch.

## Outputs
- `AWS_ROLE`: AWS role.
- `ENV`: Environment.
- `PROJECT_PREFIX`: Project Prefix.
- `AWS_REGION`: AWS Region.
- `EKS_CLUSTER`: EKS Cluster.
- `ECR_REPOSITORY`: ECR Repository.
- `K8S_NAMESPACE`: K8S Namespace.
- `SLACK_WEBHOOK_URL`: Slack Webhook URL.

## Usage
```yaml
on: [push]
jobs:
  prepare-env-job:
    runs-on: ubuntu-latest
    name: A job to prepare environment variables
    env:
      SERVICE_NAME: nginx
    outputs:
      AWS_ROLE: ${{ steps.prepare-env.outputs.AWS_ROLE }}
      ENV: ${{ steps.prepare-env.outputs.ENV }}
      PROJECT_PREFIX: ${{ steps.prepare-env.outputs.PROJECT_PREFIX }}
      AWS_REGION: ${{ steps.prepare-env.outputs.AWS_REGION }}
      EKS_CLUSTER: ${{ steps.prepare-env.outputs.EKS_CLUSTER }}
      ECR_REPOSITORY: ${{ steps.prepare-env.outputs.ECR_REPOSITORY }}
      K8S_NAMESPACE: ${{ steps.prepare-env.outputs.K8S_NAMESPACE }}
      SLACK_WEBHOOK_URL: ${{ steps.prepare-env.outputs.SLACK_WEBHOOK_URL }}
    steps:
      - uses: actions/checkout@v4
      - id: prepare-env
        uses: devikrishnamk0123/composite-actions-trial/prepare-env@dev
        with: 
          environment: dev
          branch: dev
