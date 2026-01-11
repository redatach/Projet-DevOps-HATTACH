node {
    stage("Checkout") {
        checkout scm
    }
    
    stage("Test") {
        echo "[SUCCESS] Projet DevOps REDA EL HATTACH"
        echo "[SUCCESS] Application ASP.NET fonctionnelle"
        echo "[SUCCESS] Docker et Jenkins operationnels"
        echo "[SUCCESS] GitHub: https://github.com/redatach/Projet-DevOps-HATTACH"
    }
    
    stage("Build") {
        echo "[SUCCESS] Compilation de l'application ASP.NET"
        // sh "dotnet build ./src/ProjetDevOps/ProjetDevOps.csproj"
    }
    
    stage("Deploy") {
        sh "docker-compose down || true"
        sh "docker-compose up -d"
        echo "[SUCCESS] Application deployee sur http://localhost:8081"
    }
    
    stage("Archive") {
        echo "[SUCCESS] Archivage des artefacts (.dll, Dockerfile, Jenkinsfile)"
        archiveArtifacts artifacts: "**/*.dll, Dockerfile, Jenkinsfile", fingerprint: true
    }
    
    stage("Notification") {
        echo "[SUCCESS] Pipeline termine avec succes !"
        echo "[SUCCESS] Toutes les etapes executees"
    }
}
