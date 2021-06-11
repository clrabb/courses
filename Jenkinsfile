pipeline
{
    agent any
    stages
    {
        stage( 'Build' )
        {
            steps
            {
                echo 'Building'
                sh 'ant dist'
            }
        }

        stage( 'Collecting artifacts' )
        {
            steps
            {
                echo 'Collecting artifacts'
                archiveArtifacts artifacts: '**/*.jar, **/*.tar',
                    fingerprint: true,
                    onlyIfSuccessful: true
            }
        }

        stage( 'Testing' )
        {
            steps
            {
                echo 'Deploying to CI database'
                sh 'ant db-deploy-ci'
            }
        }

        stage( 'Deploy' )
        {
            steps
            {
                echo 'Move jars'
                echo 'deploying to DEV db'
                sh 'ant db-deploy-dev'
                echo 'run smoketest'
                echo 'Done'
            }
        }
    }
}
