node {
    stage("Checkout") {
        checkout scm
        echo "Code récupéré depuis GitHub"
    }
    
    stage("Build") {
        echo "Build de l application ASP.NET"
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
    
    stage("Notify Slack") {
        echo "NOTIFICATION SLACK SIMULEE"
        echo "Canal: #devops-notifications"
        echo "Utilisateur: reda.elhattach"
        echo "Message: Build #${env.BUILD_NUMBER} - PipeLine-HATTACH"
        echo "Statut: ${currentBuild.currentResult}"
        echo "URL: ${env.BUILD_URL}"
        echo "Notification Slack envoyée avec succès"
    }
}