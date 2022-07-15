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
                    sh 'docker build -t flaskapp:v1'
                }
            } 
        }
        stage('scan') {
            script {
                sh 'trivy flaskapp:v1'
            }
            
        }
        
        
    }
}
