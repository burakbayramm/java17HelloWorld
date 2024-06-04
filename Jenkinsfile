pipeline{
    agent any
    
    parameters {
        choice choices: ['1.0.0', '1.1.0'], description: 'Product Version', name: 'product_version'
        string defaultValue: 'dev', description: 'Source Code Branch', name: 'checkout_branch'
        choice choices: ['CI', 'CD'], description: 'Pipeline Type', name: 'pipeline_type'
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
            tools {
                maven "maven_3.2.5"
                jdk "jdk-17"
            }
            steps{
                sh """
                    java --version
                    mvn -version
                    mvn clean install
                    cd target 
                    mv demo-0.0.1-SNAPSHOT.jar "helloWorld-${product_version}-${BUILD_NUMBER}.jar"
                """
            }
        }
        stage("Archive Artifacts"){
             when {
                    environment name: 'pipeline_type', value: 'CD'
                }
            steps{
                archiveArtifacts artifacts: 'target/helloWorld-*.jar', followSymlinks: false
            }
        }
        stage("Deployment "){
             when {
                    environment name: 'pipeline_type', value: 'CD'
                }
            steps{
                sh """
                    cd target
                    #java -jar hello-*.jar
                """
            }
        }
        
    }
}