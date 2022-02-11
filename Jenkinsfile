pipeline {
    agent any
    tools {
         //terraform 'terraform'
         "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }
    environment {
        TF_HOME = tool('terraform')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    
    stages{
        stage('Git Checkout') {
           steps{
            git credentialsId: 'pakuje', url: 'https://github.com/pakuje/terraform.git'
            }
        }
        
         stage('Terraform Init'){
            
            steps {                    
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'e1a3f676-5898-48b0-9234-7db83196c546',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                                
                        echo "Initialising Terraform"
                        terraform init -backend-config="access_key=$ARM_ACCESS_KEY" --backend-config="env/backend.tfvars"
                        """
                           }
                    
             }
            }
    }
}