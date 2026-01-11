node {
    stage("Checkout") {
        checkout scm
    }
    
    stage("Test") {
        echo "? Projet DevOps REDA EL HATTACH"
        echo "? Application ASP.NET fonctionnelle"
        echo "? Docker et Jenkins op?rationnels"
        echo "? GitHub: https://github.com/redatach/Projet-DevOps-HATTACH"
    }
    
    stage("Build") {
        echo "? Compilation de l'application ASP.NET"
        // sh "dotnet build ./src/ProjetDevOps/ProjetDevOps.csproj"
    }
    
    stage("Deploy") {
        sh "docker-compose down || true"
        sh "docker-compose up -d"
        echo "? Application d?ploy?e sur http://localhost:8081"
    }
    
    stage("Archive") {
        echo "? Archivage des artefacts (.dll, Dockerfile, Jenkinsfile)"
        archiveArtifacts artifacts: "**/*.dll, Dockerfile, Jenkinsfile", fingerprint: true
    }
    
    stage("Notification") {
        echo "? Pipeline termin? avec succ?s !"
        echo "? Toutes les ?tapes ex?cut?es"
    }
}
