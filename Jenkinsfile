pipeline {
   agent any 
   tools {
        maven 'Maven 3.6.3' 
    }
   
   stages {
       stage('SCM CheckOut'){
          steps {
            git branch: 'main',
                url: 'https://github.com/Asifmallick11/Java_TestApp'
          }
          }
      stage('Compile-Package'){
         steps {
             sh "mvn -version"
             sh "mvn clean install" 
             sh "mvn package"
              }
         }
   }
   post {
      always {
         cleanWs()
      }
   }
}

// 'https://github.com/Asifmallick11/Java_TestApp'