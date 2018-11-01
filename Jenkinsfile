pipeline {
  agent any
  stages {
    stage('myStage'){
      steps {
        export SSHPASS=kube
        sshpass -e ssh -o stricthostkeychecking=no kube@10.0.0.1 './reinstall.sh'        
      }
    }
  }
}