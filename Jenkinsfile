pipeline {
    agent any

    environment {
        TOMCAT_WEBAPPS_DIR = "D:\\Softwares\\Tomcat\\apache-tomcat-9.0.62\\webapps"
        FOOD_DIR = "D:\\Softwares\\Tomcat\\apache-tomcat-9.0.62\\webapps\\food"
        REPO_URL = "https://github.com/rakesh-rk-v/jenkinsRepository.git"
        BRANCH = "main"
    }

    stages {
        stage('Check Directory and Update') {
            steps {
                script {
					echo "Hello World"
                    def foodDir = new File(env.FOOD_DIR)
                    if (foodDir.exists()) {
                        echo "The Directory is Found at ${env.TOMCAT_WEBAPPS_DIR}"
                        dir(env.FOOD_DIR) {
                            echo "Current Directory: ${pwd()}"
                            bat "git pull ${env.REPO_URL} ${env.BRANCH}"
                        }
                    } else {
                        dir(env.TOMCAT_WEBAPPS_DIR) {
                            bat "git clone ${env.REPO_URL} ${env.FOOD_DIR}"
                            echo "Cloned into Web Apps"
                        }
                    }
                }
            }
        }
    }
}
