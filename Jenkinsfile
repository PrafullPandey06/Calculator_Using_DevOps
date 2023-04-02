pipeline {
    environment {
        img = ""
    }
    agent any

    stages {
        
        stage('Git Pull') {
            steps {
                git url: 'https://github.com/PrafullPandey06/Calculator_Using_DevOps.git'
       
            }
        }
        
        stage('Maven Build + JUnit Tests') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Create Docker image') {
        steps {
            script{
                img = docker.build "prafull006/calculator:latest"
            }
        }
    }
    stage('Push Docker image to DockerHub') {
        steps {
            script{
                docker.withRegistry('',"dockerHub"){
                    img.push()
                    
                }
                
            }
        }
    }
    
    stage('Removing Docker Image from Local') {
            steps {
                sh "docker rmi prafull006/calculator:latest"
            }
        }
    
    stage('Ansible pull docker image from docker hub') {
        steps {
            script{
                sh 'export LC_ALL=en_IN.UTF-8'
            }
            
            ansiblePlaybook becomeUser: 'null', 
            colorized: true, 
            disableHostKeyChecking: true, 
            installation: 'Ansible', 
            inventory: 'inventory', 
            playbook: 'playbook.yml',
            sudoUser: 'null'
            
        }
    }
}
}
