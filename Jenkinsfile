pipeline {
    agent any
    
    parameters{
        string(name: 'VERSION', defaultValue: '1.0.0', description: 'SDK Version')
    }
    stages {
        stage('Copy sdk from iOSSDK') {
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
        stage('Find Latest sdk and unzip to workplace'){
            steps{
                script{
                    def dirPath = './artifacts/Build/Version/'

                    def latestZip = sh(script: "ls -t ${dirPath}/*.zip | head -n 1", returnStdout: true).trim()

                    echo "Latest zip found: ${latestZip}"
                }
            }
        }
    }
}
