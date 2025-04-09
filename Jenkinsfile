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
                    def latestZip = sh(
                        script: "find artifacts -type f -name 'xxx*.zip' -printf '%T@ %p\\n' | sort -nr | head -n 1 | cut -d' ' -f2-",
                        returnStdout: true
                    ).trim()

                    if (!latestZip) {
                        error "No xxx.zip file found in artifacts directory."
                    }

                    echo "Latest zip found: ${latestZip}"
                }
            }
        }
    }
}
