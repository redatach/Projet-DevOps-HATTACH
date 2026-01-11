pipeline {
    agent any
    
    stages {
        // ÉTAPE 1: Checkout (obligatoire)
        stage('Checkout') {
            steps {
                echo '📦 Étape 1: Récupération du code depuis GitHub'
                checkout scm
            }
        }
        
        // ÉTAPE 2: Build (obligatoire)
        stage('Build') {
            steps {
                echo '🔨 Étape 2: Compilation de l\'application'
                sh 'dotnet build ./src/ProjetDevOps/ProjetDevOps.csproj -c Release'
            }
        }
        
        // ÉTAPE 3: Test (recommandé)
        stage('Test') {
            steps {
                echo '🧪 Étape 3: Exécution des tests'
                sh 'dotnet test ./src/ProjetDevOps/ProjetDevOps.csproj --verbosity normal'
            }
        }
        
        // ÉTAPE 4: Archive (EXIGENCE)
        stage('Archive') {
            steps {
                echo '📦 Étape 4: Archivage des artefacts'
                archiveArtifacts artifacts: 'src/ProjetDevOps/bin/Release/**/*.dll', fingerprint: true
                archiveArtifacts artifacts: 'Dockerfile, docker-compose.yml, Jenkinsfile', fingerprint: true
            }
        }
        
        // ÉTAPE 5: Docker Build (EXIGENCE)
        stage('Docker Build') {
            steps {
                echo '🐳 Étape 5: Construction de l\'image Docker'
                sh 'docker build -t projet-devops-hattach:latest .'
            }
        }
        
        // ÉTAPE 6: Deploy (EXIGENCE)
        stage('Deploy') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                echo '🚀 Étape 6: Déploiement de l\'application'
                script {
                    // Arrêter les anciens conteneurs
                    sh 'docker-compose down || true'
                    // Démarrer les nouveaux
                    sh 'docker-compose up -d'
                    // Vérifier
                    sh 'sleep 5 && docker-compose ps'
                }
                echo '✅ Application déployée sur http://localhost:8081'
            }
        }
        
        // ÉTAPE 7: Notify Slack (EXIGENCE - simulation si pas configuré)
        stage('Notify Slack') {
            steps {
                echo '📢 Étape 7: Notification Slack (simulation)'
                script {
                    // SIMULATION - À remplacer par vrai webhook Slack
                    echo "🔔 Notification Slack envoyée pour le build ${env.BUILD_NUMBER}"
                    echo "📊 Statut: ${currentBuild.currentResult}"
                    echo "📁 Job: ${env.JOB_NAME}"
                    
                    // POUR VRAI SLACK (décommente et configure) :
                    /*
                    slackSend(
                        channel: '#devops-notifications',
                        color: currentBuild.currentResult == 'SUCCESS' ? 'good' : 'danger',
                        message: "Build ${env.BUILD_NUMBER} - ${currentBuild.currentResult}\nJob: ${env.JOB_NAME}\nURL: ${env.BUILD_URL}"
                    )
                    */
                }
            }
        }
    }
    
    post {
        always {
            echo '📋 Pipeline terminé - Nettoyage'
            // Nettoyage optionnel
        }
        success {
            echo '🎉 SUCCÈS : Pipeline exécuté avec succès !'
            // Notification supplémentaire si succès
        }
        failure {
            echo '❌ ÉCHEC : Pipeline a échoué'
            // Notification d'échec
        }
    }
}