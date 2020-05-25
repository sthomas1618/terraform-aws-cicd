variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = string
  default     = ""
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Enable ``CodePipeline`` creation"
}

variable "elastic_beanstalk_application_name" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk application name. If not provided or set to empty string, the ``Deploy`` stage of the pipeline will not be created"
}

variable "elastic_beanstalk_environment_name" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk environment name. If not provided or set to empty string, the ``Deploy`` stage of the pipeline will not be created"
}

variable "github_oauth_token" {
  type        = string
  description = "GitHub Oauth Token"
}

variable "repo_owner" {
  type        = string
  description = "GitHub Organization or Person name"
}

variable "repo_name" {
  type        = string
  description = "GitHub repository name of the application to be built (and deployed to Elastic Beanstalk if configured)"
}

variable "branch" {
  type        = string
  description = "Branch of the GitHub repository, _e.g._ `master`"
}

variable "build_image" {
  type        = string
  default     = "aws/codebuild/standard:2.0"
  description = "Docker image for build environment, _e.g._ `aws/codebuild/standard:2.0` or `aws/codebuild/eb-nodejs-6.10.0-amazonlinux-64:4.0.0`"
}

variable "build_compute_type" {
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
  description = "`CodeBuild` instance size.  Possible values are: ```BUILD_GENERAL1_SMALL``` ```BUILD_GENERAL1_MEDIUM``` ```BUILD_GENERAL1_LARGE```"
}

variable "build_type" {
  type        = string
  default     = "LINUX_CONTAINER"
  description = "The type of build environment, e.g. 'LINUX_CONTAINER' or 'WINDOWS_CONTAINER'"
}

variable "buildspec" {
  type        = string
  default     = ""
  description = " Declaration to use for building the project. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html)"
}

variable "poll_source_changes" {
  type        = bool
  default     = true
  description = "Periodically check the location of your source content and run the pipeline if changes are detected"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit', 'XYZ')`"
}

variable "privileged_mode" {
  type        = bool
  default     = false
  description = "If set to true, enables running the Docker daemon inside a Docker container on the CodeBuild instance. Used when building Docker images"
}

variable "region" {
  type        = string
  default     = ""
  description = "AWS Region, e.g. `us-east-1`. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html)"
}

variable "aws_account_id" {
  type        = string
  default     = ""
  description = "AWS Account ID. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html)"
}

variable "image_repo_name" {
  type        = string
  default     = "UNSET"
  description = "ECR repository name to store the Docker image built by this module. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html)"
}

variable "image_tag" {
  type        = string
  default     = "latest"
  description = "Docker image tag in the ECR repository, e.g. 'latest'. Used as CodeBuild ENV variable when building Docker images. [For more info](http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html)"
}

variable "environment_variables" {
  type = list(object(
    {
      name  = string
      value = string
  }))

  default = [
    {
      name  = "NO_ADDITIONAL_BUILD_VARS"
      value = "TRUE"
  }]

  description = "A list of maps, that contain both the key 'name' and the key 'value' to be used as additional environment variables for the build"
}

variable "codebuild_cache_bucket_suffix_enabled" {
  type        = bool
  description = "The cache bucket generates a random 13 character string to generate a unique bucket name. If set to false it uses terraform-null-label's id value"
  default     = true
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Force destroy the CI/CD S3 bucket even if it's not empty"
}

variable "github_webhooks_token" {
  type        = string
  default     = ""
  description = "GitHub OAuth Token with permissions to create webhooks. If not provided, can be sourced from the `GITHUB_TOKEN` environment variable"
}

variable "github_webhook_events" {
  type        = list(string)
  description = "A list of events which should trigger the webhook. See a list of [available events](https://developer.github.com/v3/activity/events/types/)"
  default     = ["push"]
}

variable "webhook_enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any webhook resources"
  default     = true
}

variable "webhook_target_action" {
  type        = string
  description = "The name of the action in a pipeline you want to connect to the webhook. The action must be from the source (first) stage of the pipeline"
  default     = "Source"
}

variable "webhook_authentication" {
  type        = string
  description = "The type of authentication to use. One of IP, GITHUB_HMAC, or UNAUTHENTICATED"
  default     = "GITHUB_HMAC"
}

variable "webhook_filter_json_path" {
  type        = string
  description = "The JSON path to filter on"
  default     = "$.ref"
}

variable "webhook_filter_match_equals" {
  type        = string
  description = "The value to match on (e.g. refs/heads/{Branch})"
  default     = "refs/heads/{Branch}"
}