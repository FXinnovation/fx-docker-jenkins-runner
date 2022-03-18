FROM jenkins/jenkinsfile-runner:1.1-beta-0-adoptopenjdk-11-jre-alpine

ENV AWSCLI_VERSION=1.19.5 \
    BASH_VERSION=5.0.17-r0 \
    BZIP2_VERSION=1.0.8-r1 \
    CLOUDSDK_CORE_DISABLE_PROMPTS=1 \
    CURL_VERSION=7.69.1-r3 \
    DOCKER_VERSION=20.10.3-r0 \
    E2FSPROGS_VERSION=1.45.6-r0 \
    GCLOUDSDK_VERSION=329.0.0 \
    GIT_VERSION=2.26.2-r0 \
    GROFF_VERSION=1.22.4-r1 \
    HELM_PLUGIN_PUSH_VERSION=0.7.1 \
    HELM_VERSION=2.16.1 \
    IPTABLES_VERSION=1.8.4-r2 \
    JQ_VERSION=1.6-r1 \
    MERCURIAL_VERSION=5.4-r0 \
    OPENSSH_VERSION=8.3_p1-r1 \
    PROCPS_VERSION=3.3.16-r0 \
    PY3PIP_VERSION=20.1.1-r0 \
    PYTHON_VERSION=3.8.5-r1 \
    SUBVERSION_VERSION=1.13.0-r3 \
    UNZIP_VERSION=6.0-r8 \
    WGET_VERSION=1.20.3-r1 \
    XZ_VERSION=5.2.5-r0 \
    ZIP_VERSION=3.0-r8

ENV JENKINS_LOCAL=1

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /workspace

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

COPY /resources/jenkins.yaml /usr/share/jenkins/ref/casc/jenkins.yaml

WORKDIR /workspace

ENTRYPOINT ["/app/bin/jenkinsfile-runner-launcher"]

LABEL   "maintainer"="cloudsquad@fxinnovation.com" \
        "org.label-schema.name"="jenkins-runner" \
        "org.label-schema.base-image.name"="jenkins/jenkinsfile-runner:1.1-beta-0-adoptopenjdk-11-jre-alpine" \
        "org.label-schema.base-image.version"="1.1-beta-0-adoptopenjdk-11-jre-alpine" \
        "org.label-schema.description"="Jenkins headless in a container" \
        "org.label-schema.url"="https://github.com/jenkinsci/jenkinsfile-runner" \
        "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-jenkins-runner" \
        "org.label-schema.vendor"="FXinnovation" \
        "org.label-schema.schema-version"="1.0.0-rc.1" \
        "org.label-schema.applications.git.version"=$GIT_VERSION \
        "org.label-schema.applications.jnlp.version"=$JNLP_VERSION \
        "org.label-schema.applications.docker.version"=$DOCKER_VERSION \
        "org.label-schema.applications.google-cloud-sdk.version"=$GCLOUDSDK_VERSION \
        "org.label-schema.applications.kubectl.version"=$KUBECTL_VERSION \
        "org.label-schema.applications.bzr.version"=$BZR_VERSION \
        "org.label-schema.applications.git.version"=$GIT_VERSION \
        "org.label-schema.applications.curl.version"=$CURL_VERSION \
        "org.label-schema.applications.mercurial.version"=$MERCURIAL_VERSION \
        "org.label-schema.applications.openssh-client.version"=$OPENSSH_VERSION \
        "org.label-schema.applications.subversion.version"=$SUBVERSION_VERSION \
        "org.label-schema.applications.procps.version"=$PROCPS_VERSION \
        "org.label-schema.applications.bzip2.version"=$BZIP2_VERSION \
        "org.label-schema.applications.unzip.version"=$UNZIP_VERSION \
        "org.label-schema.applications.xz.version"=$XZ_VERSION \
        "org.label-schema.applications.jq.version"=$JQ_VERSION \
        "org.label-schema.applications.wget.version"=$WGET_VERSION \
        "org.label-schema.applications.bash.version"=$WGET_VERSION \
        "org.label-schema.applications.python2.version"=$PYTHON2_VERSION \
        "org.label-schema.applications.iptables.version"=$IPTABLES_VERSION \
        "org.label-schema.applications.e2fsprogs.version"=$E2FSPROGS_VERSION \
        "org.label-schema.applications.zip.version"=$ZIP_VERSION \
        "org.label-schema.applications.groff.version"=$GROFF_VERSION \
        "org.label-schema.applications.py2-pip.version"=$PYPIP_VERSION \
        "org.label-schema.applications.awscli.version"=$AWSCLI_VERSION \
        "org.label-schema.applications.helm.version"=$HELM_VERSION \
        "org.label-schema.applications.helm-push.version"=$HELM_PLUGIN_PUSH_VERSION \
        "org.label-schema.vcs-ref"=$VCS_REF \
        "org.label-schema.version"=$VERSION \
        "org.label-schema.build-date"=$BUILD_DATE \
        "org.label-schema.usage"="docker run --rm $(pwd):/data fxinnovation/jenkinsfile-runner help"
