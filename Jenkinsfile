pipeline {

    environment {
        registry = "konstantinnn/my-app"
        registryCredential = "docker-credentials"
        }
    agent none
    stages {
        // stage('Fetching data from Github!') {
        //     agent { 
        //         label 'master'
        //          }
        //     steps {
        //         checkout scm
        //         echo '====stage 1: Successfully pulled repo=='
        //     }
        // }

        // stage('Packaging of Java Project && creating a image && push it to DockerHub') {
        //     agent { 
        //         label 'master'
        //          }
        //     steps {
        //         script {
        //             sh "cd my-app && mvn clean"
        //             sh "cd my-app && ls"
        //             sh "cd my-app && mvn package"
        //             sh "cd my-app && ls"
        //             // sh 'docker builder prune -f'
        //             // sh 'docker rmi $(docker images -a -q)'
        //             docker.withRegistry('', registryCredential){
        //                 sh "docker build -t ${registry} ."
        //                 sh "docker push ${registry}:latest"
        //             }
        //         }
        //     }
        // }
        
        // stage('Checking Code via Sonar scanner') {
        //     agent { 
        //         label 'master'
        //          }
        //     steps {
        //         script {
        //             withSonarQubeEnv("SonarQube") {
        //             sh "cd my-app && mvn sonar:sonar -Dsonar.host.url=http://10.240.0.10:9000 -Dsonar.login=26e31db0e12146c1e30d1b5095b6e36a149b77ca"
        //             }
        //         }
        //     }
        // }     
       
        stage('Pull container image from Docker Private Repo in Dev Env') {
            agent { 
                label 'master-slave'
                }
            steps {
               sh 'kubectl apply -f /home/vagrant/prod-env.yaml -n prod'
               sh 'kubectl get pods -n prod'
               sh 'kubectl get services -o wide -n prod'
            }
        } 
    }
}
