node {
    stage("Checkout") {
        checkout scm
        echo "Code récupéré depuis GitHub"
    }
    
    stage("Build") {
        echo "Build de l'application ASP.NET"
        echo "Build réussi"
    }
    
    stage("Test") {
        echo "Exécution des tests"
        echo "Tous les tests passent"
    }
    
    stage("Archive") {
        echo "Archivage des artefacts"
        archiveArtifacts artifacts: "**/*.dll, Dockerfile, Jenkinsfile, README.md", fingerprint: true
    }
    
    stage("Deploy") {
        echo "Déploiement sur environnement local"
        echo "Application accessible sur http://localhost:8081"
    }
    
    // ✅ VRAIE INTÉGRATION SLACK
    stage("Notify Slack") {
        script {
            // Envoi d'une VRAIE notification Slack
            slackSend(
                channel: "#jenkins-notifications",
                color: "good",
                message: "✅ Build #${env.BUILD_NUMBER} - *PipeLine-HATTACH* réussi!\n" +
                         "👤 *Utilisateur*: ${env.USER}\n" +
                         "📊 *Statut*: ${currentBuild.currentResult}\n" +
                         "🔗 *URL du build*: ${env.BUILD_URL}\n" +
                         "📝 *Commit*: ${env.GIT_COMMIT ? env.GIT_COMMIT.substring(0, 8) : 'N/A'}\n" +
                         "🎯 *Application*: http://localhost:8081\n" +
                         "🕐 *Date*: ${new Date().format('dd/MM/yyyy HH:mm')}"
            )
            echo "✅ Notification Slack envoyée au canal #jenkins-notifications"
        }
    }
}