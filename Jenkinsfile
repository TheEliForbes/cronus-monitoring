node('node') {
    stage('sshStage'){
      steps {       
        sh "sshpass -e ssh -o stricthostkeychecking=no kube@10.0.0.1 './reinstall.sh'"        
      }
    }

}