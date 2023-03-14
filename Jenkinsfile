pipeline {
    // Declare variables that will be used by the later stages
    environment {
        DOCKERHUB_REGISTRY = "prafull006/calculator-devops"
        DOCKERHUB_CREDENTIALS = credentials('Prafullsatna*')
    }
    
    // The "agent" section configures on which nodes the pipeline can be 
    // run. Specifying "agent any" means that Jenkins will run the job on  
    // any of the available nodes.
    agent any 
    
    stages {
        
        stage('Git Pull') {
            steps {
                git url: 'https://github.com/PrafullPandey06/Calculator_Using_DevOps.git',
                branch: 'main'
            }
        }
        
        stage('Maven Build + JUnit Tests') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Build Docker Image') {
			steps {
				sh "docker build -t $DOCKERHUB_REGISTRY:latest ."
			}
		}

		stage('Login to Docker Hub') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push Docker Image to Docker Hub') {
			steps {
				sh 'docker push $DOCKERHUB_REGISTRY:latest'
			}
		}
        
        stage('Removing Docker Image from Local') {
            steps {
                sh "docker rmi $DOCKERHUB_REGISTRY:latest"
            }
        }
    }
}
