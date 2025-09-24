pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-creds')
        GITHUB_CREDENTIALS = credentials('github-creds')
        DEV_REPO = "pranit162/devops-project-dev"
        PROD_REPO = "pranit162/devops-project-prod"
    }

    stages {
        stage('Build & Push Docker Image') {
            steps {
                script {
                    // Determine which repo to use
                    def repo = (env.BRANCH_NAME == 'master') ? PROD_REPO : DEV_REPO

                    echo "Building Docker image for branch: ${env.BRANCH_NAME}"
                    
                    sh """
                        docker build -t ${repo}:${env.BUILD_NUMBER} .
                        echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin
                        docker push ${repo}:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }
}
