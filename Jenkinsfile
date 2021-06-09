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
                echo 'Collecting DB change sets'
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
    }
}
