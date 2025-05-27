pipeline{
    agent any
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '5')
    }
    parameters {
        string defaultValue: 'main', description: 'Checkout Branch', name: 'checkout_branch'
        choice choices: ['Yes', 'No'], name: 'archiveArtifacts'
    }
    stages{
        stage("Checkout"){
            steps{
                cleanWs()
                checkout scmGit(branches: [[name: "$checkout_branch"]], extensions: [], userRemoteConfigs: [[url: 'https://github.com/burakbayramm/java17HelloWorld']])
                sh """
                ls -ltr
                """
            }
        }
        stage("Build"){
             tools {
                maven 'maven-3.2.5'
            }
            steps{
                sh """
                mvn clean install
                cp target/demo-0.0.1-SNAPSHOT.jar helloWorld-${BUILD_NUMBER}.jar
                """
            }
        }
        stage("Archive Artifacts"){
            when {
                environment name: 'archiveArtifacts', value: 'Yes'
            }
            steps{
                archiveArtifacts artifacts: "helloWorld-${BUILD_NUMBER}.jar", followSymlinks: false
            }
        }
    }
    post {
        always {
            sh "echo Pipeline Finished"
        }
    }
}