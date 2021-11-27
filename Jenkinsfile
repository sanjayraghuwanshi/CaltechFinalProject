pipeline {
        agent {
            label 'master'
        }
        tools {
            maven 'mymaven'
            jdk 'myjava'
        }
    stages {

        stage ('Checkout the code') {
            steps{
                git branch: 'master', url: 'https://github.com/sanjayraghuwanshi/CaltechFinalProject.git'
            }
        }
        stage ('Code Compile') {
            steps{
                sh """
                mvn compile
                """
            }
        }
        stage ('Packaging') {
            steps {
                sh """
                mvn package
                """
            }
        }
		stage ('Docker build') {
            steps {
                sh """
                docker build -t sanjayraghuwanshi/caltechfinalproject:latest .
                """
            }
        }
		stage ('Docker Push') {
			steps {
			withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')])
			{
			sh """
			docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}
			docker push sanjayraghuwanshi/caltechfinalproject:latest
			docker run -d -p 127.0.0.1:8081:8080 sanjayraghuwanshi/caltechfinalproject:latest
			"""		}
				}
			}
		}
	post {
	always {
	junit 'target/surefire-reports/**/*.xml'
	}
	success {
	sh """
	echo 'Removing container stack'
    sudo docker rm -f $(sudo docker container ls -aq)
    """
			}
		}
	}
