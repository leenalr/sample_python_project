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
                 sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home/.cache:/root/.cache/ aquasec/trivy:0.18.3 image -f json -o /root/.cache/results.json flaskapp:v1'
                }
            }
            
        }
        
    }
        
    }

