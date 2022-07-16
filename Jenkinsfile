pipeline { 
    environment { 
        registry = "leenalr/flaskapp" 
        registryCredential = 'dockerhub_leena' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Building our image') { 
            steps { 
                  script { 
                    sh 'docker build -t flaskapp:v1 .'
                }
            } 
        }
    
        stage('Scan') {
            steps {
                script {
                 sh 'docker pull aquasec/trivy:0.18.3'
                 sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home/.cache:/root/.cache/ aquasec/trivy:0.18.3 flaskapp:v1 -f json -o results.json golang:1.12-alpine'
                }
            }
            
        }
        
    }
        
    }

