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
                script {
                    def tag_version = env.BUILD_ID
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh "sed 's/{{tag}}/${tag_version}/g' ./k8s/deployment.yaml > ./k8s/deployment-final.yaml"
                        sh 'kubectl apply --dry-run=client -f ./k8s/deployment-final.yaml'
                        sh 'kubectl apply -f ./k8s/deployment-final.yaml'
                        sh 'rm ./k8s/deployment-final.yaml'
                    }
                }
            }
        }
    }
}
