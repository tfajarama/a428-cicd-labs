node {
    docker.image('node:16-buster-slim').inside('-p 3000:3000') {
        stage('Build') {
            sh 'npm install'
        }
        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
        stage('Manual Approval') {
            input message: 'Lanjutkan ke tahap Deploy? (Klik "Proceed" untuk melanjutkan)'
        }
        stage('Deploy') {
            sh './jenkins/scripts/deliver.sh'
//            input message: 'Sudah selesai menggunakan React App? (Klik "Proceed" untuk mengakhiri)'
            echo 'Application is running in http://localhost:3000. Waiting for 1 minute...'
            sleep 60  // Jeda aplikasi selama 1 menit setelah berhasil di deploy
            echo '1 minute has passed. Proceeding to terminate and finish the pipeliine...'
            sh './jenkins/scripts/kill.sh'
        }
    }
}

// pipeline {
//     agent {
//         docker {
//             image 'node:16-buster-slim' 
//             args '-p 3000:3000' 
//         }
//     }
//     stages {
//         stage('Build') { 
//             steps {
//                 sh 'npm install'
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh './jenkins/scripts/test.sh'
//             }
//         }
//     }
// }