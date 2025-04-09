pipeline {
    agent any
    
    parameters{
        string(name: 'VERSION', defaultValue: '1.0.0', description: 'SDK Version')
        string(name: 'COCOAPODSWORKPLACE', defaultValue: '~/Desktop/iOS/PublishSDKONCocoapods/IMQACore/Frameworks', description: 'cocoapods 작업폴더')
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
                    def dirPath = './artifacts/Build/Version'

                    def latestZip = sh(script: "ls -t ${dirPath}/*.zip | head -n 1", returnStdout: true).trim()

                    echo "🟢🟢🟢🟢🟢Latest zip found: ${latestZip}🟢🟢🟢🟢🟢"
                    
                    sh """
                        rm -rf ${params.COCOAPODSWORKPLACE}
                    """
                    
                    sh """
                        mkdir -p ${params.COCOAPODSWORKPLACE}
                    """

                    
                    sh """
                        unzip -o ${latestZip} -d ./
                    """
                    
                    sh """
                        cp -r ./Build/xcframework/* ${params.COCOAPODSWORKPLACE}
                    """
                    
                    
                }
            }
        }
        
        stage('change workplace cocoapods IMQACore.podspec'){
            steps{
                script{
                    sh """
                        sed -i '' "s/s.version *= *\"[0-9.]*\"/s.version = \"${params.VERSION}\"/" "~/Desktop/iOS/PublishSDKONCocoapods/IMQACore.podspec"
                    """
                    
                    sh """
                        cd ~/Desktop/iOS/PublishSDKONCocoapods/
                    """
                    
                    sh """
                        git add .
                        git commit -m "chore: 更新版本至 ${params.VERSION}"
                        git tag "${params.VERSION}"
                        git push origin "${params.VERSION}"
                        git push origin main
                        echo "✅ 推送代码并创建 Tag: ${params.VERSION} 🚀"
                        pod trunk push IMQACore.podspec --allow-warnings
                    """
                }
            }
            

        }
    }
}
