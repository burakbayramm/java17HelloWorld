pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                git branch: 'jenkinsfile', url: 'https://github.com/burakbayramm/java17HelloWorld.git'
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