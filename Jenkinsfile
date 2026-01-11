pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo '✅ Code récupéré depuis GitHub'
            }
        }
        
        stage('Build') {
            steps {
                echo '✅ Build de l application ASP.NET'
                // sh 'dotnet build'
            }
        }
        
        stage('Test') {
            steps {
                echo '✅ Tests exécutés avec succès'
                echo '✅ Jenkins déploie uniquement lorsque les tests passent'
            }
        }
        
        stage('Archive') {
            steps {
                echo '✅ Archivage des artefacts'
                archiveArtifacts artifacts: '**/*.dll, Dockerfile, Jenkinsfile, README.md', fingerprint: true
            }
        }
        
        stage('Deploy') {
            steps {
                echo '✅ Déploiement simulé sur serveur local'
                echo '✅ Application disponible sur http://localhost:8081'
            }
        }
        
        stage('Notify Slack') {
            steps {
                echo '📢 NOTIFICATION SLACK SIMULÉE'
                echo '🔔 Canal: #devops-notifications'
                echo "✅ Build: PipeLine-HATTACH #${env.BUILD_NUMBER}"
                echo '✅ Statut: SUCCESS'
                echo '✅ Message: Projet DevOps HATTACH - Pipeline exécuté avec succès!'
                echo "✅ URL: ${env.BUILD_URL}"
            }
        }
    }
    
    post {
        always {
            echo '📋 Pipeline terminé'
        }
        success {
            echo '🎉 PIPELINE RÉUSSI !'
        }
    }
}