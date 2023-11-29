pipeline{
    agent{
        node{
            label "docker-jdk11"
        }
    }
    parameters {
        string defaultValue: 'main', description: 'Checkout Branch for build', name: 'branchName'
    }
    stages{
        stage('git checkout'){
            steps{
                git branch: "$branchName", url: 'https://github.com/burakbayramm/java17HelloWorld.git'
            }
        }
        stage('Hello Docker'){
            steps{
               sh """
               echo "My job working on docker! "
               
               """
            }
        }
    }
}