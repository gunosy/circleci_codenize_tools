# About this repository
For running codenize.tools on circleCI[DockerImage](https://hub.docker.com/r/saorio/codenize_tools_circleci/)


## How to Use for CircleCI

```
version: 2
jobs:
  build:
    docker:
      - image: saorio/circleci_codenize_tools:latest
    working_directory: ~/<your-repository-name>
    environment:
      AWS_REGION: us-east-1
    steps:
      - checkout
      - run:
          name: miam dry-run
          command: |
            miam --dry-run --apply -f IAMfile --region ${AWS_REGION} --no-color --no-progress
      - deploy:
          name: miam deploy
          command: |
            if [ "${CIRCLE_BRANCH}" == "master" ]; then
              miam --apply -f IAMfile --region ${AWS_REGION} --no-color --no-progress
            fi
```

CircleCI AWS Permissions requires setting Key and Secret.
