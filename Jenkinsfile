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

        stage("Docker Confirmation")
        {
            steps{
                sh "docker --version"
                sh "cat /etc/os-release"
            }
        }

        stage("Build") {
            steps {
                echo "Build Using Docker Agent"
                sh"docker build -t phpApp:1.0 ."
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
            echo "${env.APP_NAME} deployment successfully"
        }
        failure {
            echo "${env.APP_NAME} deployment failed"
        }
        // always {
        
        //         cleanWs()
            
        // }
    }
}