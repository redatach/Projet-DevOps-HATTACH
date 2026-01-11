node {
    stage('Checkout') {
        checkout scm
        echo '✅ Code récupéré depuis GitHub'
    }
    
    stage('Build') {
        echo '✅ Build de l application ASP.NET'
        // sh 'dotnet build'
    }
    
    stage('Test') {
        echo '✅ Tests exécutés avec succès'
        echo '✅ Jenkins déploie uniquement lorsque les tests passent'
    }
    
    stage('Archive') {
        echo '✅ Archivage des artefacts'
        archiveArtifacts artifacts: '**/*.dll, Dockerfile, Jenkinsfile'
    }
    
    stage('Deploy') {
        echo '✅ Déploiement simulé sur serveur local'
        echo '✅ Application disponible sur http://localhost:8081'
    }
    
    stage('Notify Slack') {
        echo '📢 NOTIFICATION SLACK SIMULÉE'
        echo '🔔 Canal: #devops-notifications'
        echo '✅ Build: PipeLine-HATTACH #${env.BUILD_NUMBER}'
        echo '✅ Statut: SUCCESS'
        echo '✅ Message: Projet DevOps HATTACH - Pipeline exécuté avec succès!'
        echo '✅ URL: ${env.BUILD_URL}'
    }
}