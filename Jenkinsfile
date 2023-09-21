// Another port for jenkins
// /opt/homebrew/opt/openjdk@17/bin/java -Dmail.smtp.starttls.enable\=true -jar /opt/homebrew/opt/jenkins-lts/libexec/jenkins.war --httpListenAddress\=127.0.0.1 --httpPort\=7070
def git_ref = params.Git.split('/')
def cfg_ref = params.Config
// def rep_name = git_ref[-1].split('.')[0]

pipeline {
    // TODO: MacOS Jenkins can't refer to Mac docker when using agent{docker} 
    // agent {
    //     docker {
    //         image 'axidex/devsecops:latest'
    //     }
    // }
    //agent { dockerfile true }
    agent any

    stages {
        stage('SCM') {
            steps {
                echo 'SCM..'

                sh 'git clone ' + params.Git + ' app'// https://github.com/0c34/govwa https://github.com/netlify/gocommerce
            }
        }

        stage('SAST') {
            steps {
                echo 'SAST..'
                sh 'cd app && semgrep ' + cfg_ref + ' --output ../scan_results.json --json'
                sh 'cd app && semgrep ci'
                sh 'python3.10 log.py'
                sh 'cat data.json'
            }
        }

    }
    
    post {
        // Clean after build
        always {
                cleanWs( patterns: [[pattern: '.json', type: 'EXCLUDE']] )
        }
    }
}