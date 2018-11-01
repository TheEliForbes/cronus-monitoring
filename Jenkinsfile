pipeline {
  agent any
  environment {
     def SSHPASS = 'kube'
  }
  stages {
    stage('installStage'){
      steps {
        sh "apt-get update -qq && apt-get install -y -qq sshpass"
      }
    }
    stage('sshStage'){
      steps {       
        sh "sshpass -e ssh -o stricthostkeychecking=no kube@10.0.0.1 './reinstall.sh'"        
      }
    }
  }
}