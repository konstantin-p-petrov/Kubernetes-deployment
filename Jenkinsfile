pipeline {
    environment {
        registry = "konstantinnn/my-app"
        registryCredential = "docker-credentials"
        }
    agent none
    stages {
        stage('Fetching data from Github!') {
            agent { 
                label 'master'
                 }
            steps {
                checkout scm
                script{
                    sh 'git pull origin release'
                }
                echo '====stage 1: Successfully pulled repo=='
            }
        }
        stage('Packaging of Java Project') {
            agent { 
                label 'master'
                 }
            steps {
                sh 'mvn --version'
                sh 'cd my-app && mvn clean'
                sh 'cd my-app && mvn package'
                echo '====stage 1: Successfully tested and packed Java Web Application===='
            }
        }
        
        stage('Checking Code via Sonar scanner') {
            agent { 
                label 'master'
                 }
            steps {
                script {
                    withSonarQubeEnv("SonarQube") {
                    sh "cd my-app && mvn sonar:sonar -Dsonar.host.url=http://10.240.0.10:9000 -Dsonar.login=26e31db0e12146c1e30d1b5095b6e36a149b77ca"
                    }
                }
            }
        }     

        stage('Build a container image and push it to Docker Private Repo') {
            agent { 
                label 'master'
                 }
            steps {
                script {
                    docker.withRegistry('', registryCredential){
                        def test_image = docker.build registry
                        test_image.push('latest')
                    }
                }
            }
        }     

        stage('Pull container image from Docker Private Repo') {
            agent { 
                label 'Test-Slave'
                 }
            steps {
                script {
                    sh "docker rm -f test"
                    docker.withRegistry('', registryCredential){
                        image = docker.image('konstantinnn/my-app:latest')
                        image.pull()   
                        
                    }
                }
            }
        } 
      
      stage('Running the container') {
            agent { 
                label 'Test-Slave'
                 }
            steps {
                script {
                    sh "docker rm -f test"
                    sh "docker run -dp 8080:8080 --name test konstantinnn/my-app:latest"
                    }
            }
                
        }
    }
}
