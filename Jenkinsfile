pipeline {
    agent any
    
    parameters{
        string(name: 'VERSION', defaultValue: '1.0.0', description: 'SDK Version')
    }
    stages {
        stage('Build') {
            steps {
                script{
                    sh """
                        echo "🚀🚀🚀🚀🚀...Publish Cocoapods...🚀🚀🚀🚀🚀"
                    """
                    copyArtifacts(
                        projectName: 'iOS SDK',
                        selector: lastSuccessful()
                    )
                        
                    sh 'ls -l'
                                        
                    sh """
                        pwd
                    """
                                    

                }
            }
        }
    }
}
