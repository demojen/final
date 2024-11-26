pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('aws-credentials-id') 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform"
                sh '''
                terraform init
                '''
            }
        }

        stage('Linting') {
            steps {
                echo "Running Terraform linting"
                sh '''
                terraform fmt -check
                '''
            }
        }

        stage('Unit Tests') {
            steps {
                echo "Running Terraform unit tests"
                sh '''
                terraform validate
                '''
            }
        }

        stage('Integration Tests') {
            steps {
                echo "Running Terraform integration tests using terraform test"
                sh '''
                terraform test
                '''
            }
        }

        stage('Apply Changes') {
            when {
                branch 'main'
            }
            steps {
                input "Deploy to production?"
                echo "Applying Terraform changes"
                sh '''
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo "Pipeline completed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
