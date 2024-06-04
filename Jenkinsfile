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
        stage("CleanWorkspace"){
            steps{
                cleanWs()
            }
        }
        stage("Source code checkout"){
            steps{
                git branch: "$checkout_branch", url: 'https://github.com/burakbayramm/java17HelloWorld'
                // checkout scmGit(branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/burakbayramm/java17HelloWorld']])
                // checkout scmGit(branches: [[name: 'main']], extensions: [[$class: 'SparseCheckoutPaths', sparseCheckoutPaths: [[path: 'src/']]]], userRemoteConfigs: [[url: 'https://github.com/burakbayramm/java17HelloWorld']])
            }
        }
        stage("Project Build"){
            steps{
                sh """
                    echo "This is my first Jenkins project!" > echo.jar
                    mv echo.jar "echo-${product_version}-${BUILD_NUMBER}.jar"
                """
                sh """
                    mvn clean install
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