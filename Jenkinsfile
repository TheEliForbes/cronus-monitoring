pipeline {
  agent any
  stages {
    stage('myStage'){
      steps {
        sh 'git clone https://github.com/Eliforbes42/TIKsm-setup.git'
        sh 'cd TIKsm-setup/gtikk-charts'
        sh 'chmod +x *.sh'
        sh './initHelm.sh' 
      }
    }
  }
}