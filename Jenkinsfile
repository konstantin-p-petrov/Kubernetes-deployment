
pipeline {
    agent none
    stages {
        stage('Fetching data from Github!') {
            agent { 
                label 'master'
                 }
            steps {
                checkout scm
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
        stage("Code Checkout from Github") {
            agent { 
                label 'master'
                 }
            steps {
            git branch: 'release',
                url: 'https://github.com/konstantin-p-petrov/Project/'
            }
        }
        stage('Checking Code via Sonar scanner') {
            agent { 
                label 'master'
                 }
            steps {
                script {
                def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv("SonarQube") {
                    sh "${tool("sonarqube")}/opt/sonarscanner \
                    -Dsonar.projectKey=test \
                    -Dsonar.sources=. \
                    -Dsonar.css.node=. \
                    -Dsonar.host.url=http://http://10.240.0.10:9000"
                    }
                }
            }
        }     


       // stage('Transfering files between OpS and ApS') {
       //     agent { 
       //         label 'test-slave'
       //     }
       //     steps {
       //         sh 'scp jenkins@10.240.0.10:/var/lib/jenkins/workspace/HelloWorld/my-app/target/testing-junit5-mockito-1.0.jar jenkins@10.240.0.20:/home/jenkins'
       //     }
       // }
        stage('Starting Service file') {
            agent { 
                label 'test-slave'
            }
            steps {
                sh 'sudo systemctl stop myapp.service'
                sh 'sudo systemctl start myapp.service'
                sh 'sudo systemctl status myapp.service'
            }
        }
    }
}