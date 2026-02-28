pipeline {

    agent any

    options {
        timeout(time: 30, unit: 'MINUTES')
        retry(2)
    }

    environment {
        APP_NAME = "MyPhpApp"
        APP_BUILD_NUMBER = "${BUILD_NUMBER}"
    }

    stages {

        stage("Build") {
            steps {
                echo "Build Completed"
            }
        }

        stage("AWS Authentication") {
            steps {
                echo "AWS Authentication"
            }
        }

        stage("ECR Login") {
            steps {
                echo "ECR Login Completed"
            }
        }

        stage("Tag and Push to ECR") {
            steps {
                echo "Image Pushed Successfully"
            }
        }

        stage("Debug Branch") {
            steps {
                echo "BRANCH_NAME = ${env.BRANCH_NAME}"
                echo "GIT_BRANCH = ${env.GIT_BRANCH}"
            }
        }

        stage("Deploy to ECS") {
            // when {
            //     branch "main"
            // }
            steps {
                echo "Image Deployed Successfully"
            }
        }
    }

    post {
        success {
            echo "${APP_NAME} deployment successfully"
        }
        failure {
            echo "${APP_NAME} deployment failed"
        }
        always {
            cleanWs()
        }
    }
}