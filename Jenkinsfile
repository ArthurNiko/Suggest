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
                sh "sh script1.sh"
             }
        }
        stage('Production'){
            steps {
                sh "mvn verify"
             }
        }
    }
}