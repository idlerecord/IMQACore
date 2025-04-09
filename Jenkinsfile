pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script{
                    sh """
                        echo "🚀🚀🚀🚀🚀...Publish Cocoapods...🚀🚀🚀🚀🚀"
                    """
                    
                    // 获取 Pipeline A 最近一次构建的信息
                    def iOSSdkMakerPipeline = build(job: 'iOS SDK',
                                                propagate: false, // 如果构建失败，不会传播错误
                                                 wait: true)  // 等待完成
                                                 
                    def artifacts = iOSSdkMakerPipeline.getArtifacts()
                    
                    sh """
                        echo "📃📃📃Artifacts from iOS SDK pipeline ${artifacts}"
                    """
                    
                    sh """
                        pwd
                    """
                                    

                }
            }
        }
    }
}
