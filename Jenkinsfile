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
                                        
                    sh """
                        pwd
                    """
                                    

                }
            }
        }
    }
}
