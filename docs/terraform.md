## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `policy` or `role`) | list(string) | `<list>` | no |
| aws_account_id | AWS Account ID. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html) | string | `` | no |
| branch | Branch of the GitHub repository, _e.g._ `master` | string | - | yes |
| build_compute_type | `CodeBuild` instance size.  Possible values are: ```BUILD_GENERAL1_SMALL``` ```BUILD_GENERAL1_MEDIUM``` ```BUILD_GENERAL1_LARGE``` | string | `BUILD_GENERAL1_SMALL` | no |
| build_image | Docker image for build environment, _e.g._ `aws/codebuild/standard:2.0` or `aws/codebuild/eb-nodejs-6.10.0-amazonlinux-64:4.0.0` | string | `aws/codebuild/standard:2.0` | no |
| build_type | The type of build environment, e.g. 'LINUX_CONTAINER' or 'WINDOWS_CONTAINER' | string | `LINUX_CONTAINER` | no |
| buildspec | Declaration to use for building the project. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html) | string | `` | no |
| codebuild_cache_bucket_suffix_enabled | The cache bucket generates a random 13 character string to generate a unique bucket name. If set to false it uses terraform-null-label's id value | bool | `true` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| elastic_beanstalk_application_name | Elastic Beanstalk application name. If not provided or set to empty string, the ``Deploy`` stage of the pipeline will not be created | string | `` | no |
| elastic_beanstalk_environment_name | Elastic Beanstalk environment name. If not provided or set to empty string, the ``Deploy`` stage of the pipeline will not be created | string | `` | no |
| enabled | Enable ``CodePipeline`` creation | bool | `true` | no |
| environment_variables | A list of maps, that contain both the key 'name' and the key 'value' to be used as additional environment variables for the build | object | `<list>` | no |
| force_destroy | Force destroy the CI/CD S3 bucket even if it's not empty | bool | `false` | no |
| github_oauth_token | GitHub Oauth Token | string | - | yes |
| github_webhook_events | A list of events which should trigger the webhook. See a list of [available events](https://developer.github.com/v3/activity/events/types/) | list(string) | `<list>` | no |
| github_webhooks_token | GitHub OAuth Token with permissions to create webhooks. If not provided, can be sourced from the `GITHUB_TOKEN` environment variable | string | `` | no |
| image_repo_name | ECR repository name to store the Docker image built by this module. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html) | string | `UNSET` | no |
| image_tag | Docker image tag in the ECR repository, e.g. 'latest'. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html) | string | `latest` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | - | yes |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | string | `` | no |
| poll_source_changes | Periodically check the location of your source content and run the pipeline if changes are detected | bool | `true` | no |
| privileged_mode | If set to true, enables running the Docker daemon inside a Docker container on the CodeBuild instance. Used when building Docker images | bool | `false` | no |
| region | AWS Region, e.g. `us-east-1`. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html) | string | `` | no |
| repo_name | GitHub repository name of the application to be built (and deployed to Elastic Beanstalk if configured) | string | - | yes |
| repo_owner | GitHub Organization or Person name | string | - | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', or 'test' | string | `` | no |
| tags | Additional tags (e.g. `map('BusinessUnit', 'XYZ')` | map(string) | `<map>` | no |
| webhook_authentication | The type of authentication to use. One of IP, GITHUB_HMAC, or UNAUTHENTICATED | string | `GITHUB_HMAC` | no |
| webhook_enabled | Set to false to prevent the module from creating any webhook resources | bool | `true` | no |
| webhook_filter_json_path | The JSON path to filter on | string | `$.ref` | no |
| webhook_filter_match_equals | The value to match on (e.g. refs/heads/{Branch}) | string | `refs/heads/{Branch}` | no |
| webhook_target_action | The name of the action in a pipeline you want to connect to the webhook. The action must be from the source (first) stage of the pipeline | string | `Source` | no |

## Outputs

| Name | Description |
|------|-------------|
| codebuild_badge_url | The URL of the build badge when badge_enabled is enabled |
| codebuild_cache_bucket_arn | CodeBuild cache S3 bucket ARN |
| codebuild_cache_bucket_name | CodeBuild cache S3 bucket name |
| codebuild_project_id | CodeBuild project ID |
| codebuild_project_name | CodeBuild project name |
| codebuild_role_arn | CodeBuild IAM Role ARN |
| codebuild_role_id | CodeBuild IAM Role ID |
| codepipeline_arn | CodePipeline ARN |
| codepipeline_id | CodePipeline ID |

