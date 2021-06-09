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
                echo 'Running unit tests'
                sh cd database/liquibase/sql
                liquibase update
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
