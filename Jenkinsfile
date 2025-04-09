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
                    
                    sh """
                        echo "Cocoapods Will Upload Version: ${params.VERSION}"
                    """
                                            
                    sh 'ls -l'
                                        
                    copyArtifacts(
                        projectName: 'iOSSDK',
                        selector: lastSuccessful(),
                        target: 'artifacts'
                    )
                    
                    sh 'ls -l'

                }
            }
        }
    }
}
