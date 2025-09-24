pipeline {
    agent any

    environment {
        DOCKER_HUB_DEV = "pranit162/devops-project-dev"
        DOCKER_HUB_PROD = "pranit162/devops-project-prod"
        GITHUB_CREDENTIALS = 'github-creds'
        DOCKER_CREDENTIALS = 'docker-creds'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}",
                    credentialsId: "${GITHUB_CREDENTIALS}",
                    url: 'https://github.com/Wanted162/devops-project.git'
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                script {
                    // Choose image based on branch
                    def imageName = (env.BRANCH_NAME == 'dev') ? "${DOCKER_HUB_DEV}:latest" : "${DOCKER_HUB_PROD}:latest"

                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                          echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                          docker build -t ${imageName} .
                          docker push ${imageName}
                        """
                    }
                }
            }
        }
    }
}
