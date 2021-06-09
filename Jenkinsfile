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
            }
        }

        stage( 'Collecting artifacts' )
        {
            steps
            {
                echo 'Collecting jars'
            }
            steps
            {
                echo 'Collecting DB change sets'
            }
        }

        stage( 'Testing' )
        {
            steps
            {
                echo 'Running unit tests'
            }

            steps
            {
                echo 'Deploying CI DB changesets'
            }
        }
    }
}
