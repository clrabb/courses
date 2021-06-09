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
                archiveArtifacts artifacts: 'dist/*'
                    fingerprint: true
                    onlyIfSuccessful: true
            }
        }

        stage( 'Testing' )
        {
            steps
            {
                echo 'Running unit tests'
                echo 'Deploying CI DB changesets'
            }
        }

        stage( 'Deploy' )
        {
            steps
            {
                echo 'Move jars'
                echo 'deploy DB'
                echo 'run smoketest'
                echo 'Done'
            }
        }
    }
}
