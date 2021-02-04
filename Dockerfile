FROM jenkins/jenkinsfile-runner:1.1-beta-0-adoptopenjdk-11-jre-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /data

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

ENTRYPOINT ["/app/bin/jenkinsfile-runner-launcher"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="jenkins-runner" \
      "org.label-schema.base-image.name"="docker.io/library/docker" \
      "org.label-schema.base-image.version"="1.1-beta-0-adoptopenjdk-11-jre-alpine" \
      "org.label-schema.description"="Jenkins headless in a container" \
      "org.label-schema.url"="https://github.com/jenkinsci/jenkinsfile-runner" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-jenkins-runner" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm $(pwd):/data fxinnovation/jenkinsfile-runner help"
