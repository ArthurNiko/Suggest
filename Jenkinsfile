pipeline {
    agent any
    tools {
        maven 'Maven-Tool'
    }
    parameters {
        string defaultValue: '1.0', description: '', name: 'version', trim: false
    }
    stages {
        stage('Release'){
            when {
                branch 'release/*'
            }
            steps {
                // sh "chmod +x script1.sh"
                withCredentials([usernamePassword(credentialsId: 'b2f8966b-16e3-4c2e-9a48-eb0c3bd94f34', passwordVariable: 'GIT_PASS', usernameVariable: 'GIT_USER')]) {

                sh "sh script1.sh"
                }
             }
        }
        stage('Production'){
            steps {
                sh "mvn verify"
             }
        }
    }
}