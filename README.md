# Docker jenkins-runner
[![](https://images.microbadger.com/badges/version/fxinnovation/jenkins-runner.svg)](https://microbadger.com/images/fxinnovation/jenkins-runner "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/fxinnovation/jenkins-runner.svg)](https://microbadger.com/images/fxinnovation/jenkins-runner "Get your own image badge on microbadger.com")

## Description
This image contains a jenkins headless to run. The image is based on https://github.com/jenkinsci/jenkinsfile-runner (ubuntu). It should be more lightweight this way.

## Tags
We push a `latest` tag on this repository, to run an older version please checkout the different tags.

## Usage
`docker run --rm -v $(pwd):/data fxinnovation/jenkins-runner help`

## Labels
We set labels on our images with additional information on the image. we follow the guidelines defined at http://label-schema.org/. Visit their website for more information about those labels.

## Comments & Issues
If you have comments or detect an issue, please be advised we don't check the docker hub comments. You can always contact us through the repository.

## Contributions
Contributions are welcome.

### CHANGELOG.md
To help you write the CHANGELOG.md, one can use the `git changelog` command. This command is made available when installing `git-extras`.
