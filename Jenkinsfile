pipeline {
    agent any

    stages{
        stage('Build Docker Image'){
            steps{
                script {
                    dockerapp = docker.build("mariaeduarda05/guia-jenkins:${env.BUILD_ID}", '-f ./src/Dockerfile ./src')
                }
            }
        }

        stage('Push Docker Image'){
            steps{
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

        stage('Deploy no Kubernetes') {
            steps {
                withCredentials([string(credentialsId: 'kubeconfig-content', variable: 'KUBECONFIG_CONTENT')]) {
                    script {
                        writeFile file: 'kubeconfig.yaml', text: "${KUBECONFIG_CONTENT}"
                        sh 'export KUBECONFIG=$(pwd)/kubeconfig.yaml && kubectl get pods'
                    }
                }
            }
        }
    }
}
