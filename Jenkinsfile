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
                      sh'docker build -t leenalr/flaskapp:${BUILD_NUMBER} .'
                }
            } 
        }
        stage('push our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        sh "docker push leenalr/flaskapp:${BUILD_NUMBER}"
                    }
                } 
            }
        } 
        
    }
}
