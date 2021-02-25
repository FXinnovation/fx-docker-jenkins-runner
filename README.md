# Docker jenkins-runner
[![](https://images.microbadger.com/badges/version/fxinnovation/jenkins-runner.svg)](https://microbadger.com/images/fxinnovation/jenkins-runner "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/fxinnovation/jenkins-runner.svg)](https://microbadger.com/images/fxinnovation/jenkins-runner "Get your own image badge on microbadger.com")

**Project in beta**

Tested pipelines:
- fxDockerImage

## Description

This image contains a jenkins headless to run pipeline on any workstation.
The image is based on https://github.com/jenkinsci/jenkinsfile-runner (alpine).
See [Usage](#Usage)

## How it works
Jenkins itself as well as all plugins used by FX are installed in this docker image.
As a consequence, this image is very similar to [FX own Jenkins slave image](https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-jenkinsk8sslave)
Because there is no full Jenkins running in the background but just the core, Jenkins credentials or pipeline libraries does not work out of the box.
To circumvent the issue, configuration must be done with a configuration file.
It is possible using the [Configuration As Code](https://plugins.jenkins.io/configuration-as-code/) module to handle credentials and pipeline libraries.

## Tags
We push a `latest` tag on this repository, to run an older version please checkout the different tags.

## Usage

1. Setup a gitea token (Configuration > Applications > Manage tokens);
1. Update credentials in your configuration file;
1. Change directory to the code you want to test;
1. Copy `resource/jenkins.yaml` to a local path (e.g. ~/.config/jenkins_runner/configuration). Careful, might contain passwords, so protect the file!;
1. Run:

```
    docker run --rm \
        -v $(pwd):/workspace/ -w /workspace \ # This allow this docker image to access the project Jenkinsfile
        -e JENKINS_DOCKER_DATA_BASEPATH=$(pwd) \ # This will allow FX pipeline dockers to run locally, by knowing where are the source files in the host
        -v ~/.config/jenkins_runner/configuration/:/usr/share/jenkins/ref/casc \ # This will give jenkins the access to your custom config files, containing passwords
        -v /var/run/docker.sock:/var/run/docker.sock \ # This will allow the docker image to run other dockers
        fxinnovation/jenkins-runner:latest \ # The name of the image. Prefer to use a tagged version
        --no-sandbox # disables Jenkins security sandbox, not very useful in a local environment
```

## Labels
We set labels on our images with additional information on the image. we follow the guidelines defined at http://label-schema.org/. Visit their website for more information about those labels.

## Comments & Issues
If you have comments or detect an issue, please be advised we don't check the docker hub comments. You can always contact us through the repository.

## Contributions
Contributions are welcome.

### CHANGELOG.md
To help you write the CHANGELOG.md, one can use the `git changelog` command. This command is made available when installing `git-extras`.
