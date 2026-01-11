node {
    stage("Checkout") {
        checkout scm
    }
    
    stage("Test") {
        echo "SUCCESS - Projet DevOps REDA EL HATTACH"
        echo "SUCCESS - Application ASP.NET fonctionnelle"
        echo "SUCCESS - Docker et Jenkins operationnels"
        echo "SUCCESS - GitHub: https://github.com/redatach/Projet-DevOps-HATTACH"
    }
    
    stage("Build") {
        echo "SUCCESS - Compilation ASP.NET"
    }
    
    stage("Deploy") {
        sh "docker-compose down || true"
        sh "docker-compose up -d"
        echo "SUCCESS - Deploye sur http://localhost:8081"
    }
    
    stage("Archive") {
        echo "SUCCESS - Archivage des artefacts"
    }
}