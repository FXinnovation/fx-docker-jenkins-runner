library identifier: 'fxinnovation-private-pipeline-jenkins@feature/localRun', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-private/pipeline-jenkins.git',
   credentialsId: 'guillaume-donval-gitea'])

library identifier: 'fxinnovation-public-pipeline-jenkins@feature/localPipeline', retriever: modernSCM(
  [$class: 'GiteaSCMSource',
   serverUrl: 'https://scm.dazzlingwrench.fxinnovation.com',
   repoOwner: 'fxinnovation-public',
   repository: 'pipeline-jenkins'])

env.DEBUG=true
fxDockerImage(
  image: 'jenkins-runner',
  pushLatest: true,
  launchLocally: true
)
