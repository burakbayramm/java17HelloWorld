pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                git branch: 'jenkinsfile', url: 'https://github.com/burakbayramm/java17HelloWorld.git'
            }
        }
        stage('sleep'){
            steps{
               sh "sleep 60000"
            }
        }
    }
}