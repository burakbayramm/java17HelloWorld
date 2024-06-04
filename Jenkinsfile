pipeline{
    agent any
    
    parameters {
        choice choices: ['1.0.0', '1.1.0'], description: 'Product Version', name: 'product_version'
        string defaultValue: 'dev', description: 'Source Code Branch', name: 'checkout_branch'
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '4')
    }
    stages{
        stage("ClenWorkspace"){
            steps{
                cleanWs()
            }
        }
        stage("Additional Stage"){
            steps{
                sh """
                echo "my additional stage is added from scm"
                """
            }
        }
        stage("Project Build"){
            steps{
                sh """
                    echo "This is my first Jenkins project!" > echo.jar
                    mv echo.jar "echo-${product_version}-${BUILD_NUMBER}.jar"
                """
            }
        }
        stage("Archive Artifacts"){
            steps{
                archiveArtifacts artifacts: 'echo*.jar', followSymlinks: false
            }
        }
        
    }
}