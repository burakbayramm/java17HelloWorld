pipeline{
    agent{
        node{
            label "node1"
        }
    }
    parameters {
        string defaultValue: 'main', description: 'Checkout Branch for build', name: 'branchName'
    }
    stages{
        stage('CleanWorkspace'){
            steps{
               cleanWs()
            }
        }
        stage('git checkout'){
            steps{
                checkout scm
            }
        }
        stage('build'){
            steps{
               sh """
               echo "Build Started!"
               mvn clean install
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