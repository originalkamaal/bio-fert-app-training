pipeline {
    agent any

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "main", url: 'https://github.com/originalkamaal/bio-fert-app-training.git'
            }
        }
        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  flutter build apk --debug
                  '''
            }
        }
        stage('DISTRIBUTE') {
            steps {
                appCenter apiToken: '49d5eece443e125308d5b1efcbab397daa644599',
                        ownerName: 'Kamaal Khan',
                        appName: 'Flutter-Starter',
                        pathToApp: 'build/app/outputs/apk/debug/app-debug.apk',
                        distributionGroups: 'BetaTesters'
            }
        }
    }
}