pipeline{
    agent any
    parameters {
        string defaultValue: 'main', description: 'Checkout Branch for build', name: 'branchName'
    }
    stages{
        stage('git checkout'){
            steps{
                git branch: "$branchName", url: 'https://github.com/burakbayramm/helloworld.git'
                sh "ls -ltr"
            }
        }
        stage('build'){
            steps{
               sh """
               echo "Build Started!"
               #mvn clean install
               echo "Build Finished!"
               """
            }
        }
        stage('artifacts'){
            steps{
               sh """
               cd target
               ls -ltr | grep .jar
               """
               archiveArtifacts artifacts: 'target/demo-0.0.1-SNAPSHOT.jar', followSymlinks: false
            }
        }
    }
}