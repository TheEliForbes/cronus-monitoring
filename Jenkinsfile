pipeline {
  agent any
  stages {
    stage('myStage'){
      steps {
        checkout scm
        sh "chmod +x gtikk-charts/*.sh"
        sh "./gtikk-charts/initHelm.sh" 
      }
    }
  }
}