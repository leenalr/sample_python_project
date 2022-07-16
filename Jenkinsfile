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
                 sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home/.cache:/root/.cache/ aquasec/trivy:0.18.3 flaskapp:v1'
                 sh 'mkdir -p reports'
                 sh 'trivy filesystem --ignore-unfixed --vuln-type os,library --format template --template "@html.tpl" -o reports/nodjs-scan.html ./nodejs'
                 publishHTML target : [
                    allowMissing: true,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: 'reports',
                    reportFiles: 'nodjs-scan.html',
                    reportName: 'Trivy Scan',
                    reportTitles: 'Trivy Scan'
                    ]

                // Scan again and fail on CRITICAL vulns
                sh 'trivy filesystem --ignore-unfixed --vuln-type os,library --exit-code 1 --severity CRITICAL ./nodejs'
                   }
            }
            
        }
        
    }
        
    }

