pipeline{
    agent {
        label 'slave'
    }

    stages{
        stage('Hostname'){
            steps{
                sh 'hostname'
            }
        }

        stage('Memory usage'){
            steps{
                sh 'free -h'
            }
        }

        stage('Disk Usage'){
            steps{
                sh 'df -kh'
            }
        }

        stage('Cpu details'){
            steps{
                sh 'lscpu'
            }
        }
    }
}
