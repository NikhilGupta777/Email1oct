#!/bin/bash

# AWS Deployment Script for Email Management System
# Make sure you have AWS CLI installed and configured

set -e

echo "🚀 Starting AWS Deployment..."

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed. Please install it first:"
    echo "https://aws.amazon.com/cli/"
    exit 1
fi

# Check if user is logged in to AWS
if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS CLI is not configured. Please run: aws configure"
    exit 1
fi

echo "✅ AWS CLI is configured"

# Option 1: Deploy to Elastic Beanstalk (Easiest)
deploy_to_elastic_beanstalk() {
    echo "📦 Deploying to AWS Elastic Beanstalk..."

    # Create application if it doesn't exist
    if ! aws elasticbeanstalk describe-applications --application-names email-management-app &> /dev/null; then
        echo "Creating Elastic Beanstalk application..."
        aws elasticbeanstalk create-application --application-name email-management-app --description "Email Management System"
    fi

    # Create environment if it doesn't exist
    if ! aws elasticbeanstalk describe-environments --application-name email-management-app --environment-names email-management-prod &> /dev/null; then
        echo "Creating Elastic Beanstalk environment..."
        aws elasticbeanstalk create-environment \
            --application-name email-management-app \
            --environment-name email-management-prod \
            --solution-stack-name "Python 3.9 running on 64bit Amazon Linux 2" \
            --version-label "v1" \
            --option-settings \
                "Namespace=aws:elasticbeanstalk:environment:proxy:staticfiles,OptionName=/static,Value=static/" \
                "Namespace=aws:elasticbeanstalk:application:environment,OptionName=PORT,Value=5000" \
                "Namespace=aws:elasticbeanstalk:application:environment,OptionName=ENVIRONMENT,Value=production"
    fi

    # Create source bundle
    echo "📦 Creating deployment package..."
    zip -r app-deployment.zip . -x "*.git*" "node_modules/*" "*.env" "deploy*" "README*" "*.md" "*.toml" "*.yaml" "*.yml" "*.json" "*.sh" "*.ebextensions*"

    # Deploy to Elastic Beanstalk
    echo "🚀 Deploying to Elastic Beanstalk..."
    aws elasticbeanstalk create-application-version \
        --application-name email-management-app \
        --version-label "v$(date +%s)" \
        --source-bundle S3Bucket=email-management-deployments-$(aws sts get-caller-identity --query Account --output text),S3Key=app-deployment.zip

    # Update environment
    aws elasticbeanstalk update-environment \
        --application-name email-management-app \
        --environment-name email-management-prod \
        --version-label "v$(date +%s)"

    echo "✅ Deployment initiated! Check AWS Console for status."
    echo "🌐 Your app will be available at: http://email-management-prod.$(aws elasticbeanstalk describe-environments --application-name email-management-app --environment-names email-management-prod --query Environments[0].CNAME --output text)"
}

# Option 2: Deploy to App Runner (Serverless)
deploy_to_app_runner() {
    echo "🏃 Deploying to AWS App Runner..."

    # Create connection (GitHub)
    echo "🔗 Connecting to GitHub repository..."
    echo "Please ensure your repository is public or create a GitHub connection in App Runner first."

    # For manual deployment, you would use:
    echo "📝 To deploy manually:"
    echo "1. Go to AWS App Runner Console"
    echo "2. Create service"
    echo "3. Connect to your GitHub repository"
    echo "4. Set port to 8000"
    echo "5. Add environment variables"
    echo "6. Deploy!"

    echo "Or use AWS CLI:"
    echo "aws apprunner create-service --cli-input-json file://aws-app-runner-config.json"
}

# Option 3: Deploy to Lightsail (Simple VPS)
deploy_to_lightsail() {
    echo "💡 Deploying to AWS Lightsail..."

    # Create instance
    echo "Creating Lightsail instance..."
    aws lightsail create-instances \
        --instance-names email-management \
        --availability-zone us-east-1a \
        --blueprint-id amazon_linux_2 \
        --bundle-id nano_3_0 \
        --key-pair-name email-management-key

    echo "⚙️ Setting up instance..."
    echo "Please wait for instance to be running, then SSH and run setup manually."
    echo "Setup commands:"
    echo "sudo yum update -y"
    echo "sudo yum install python3 pip git -y"
    echo "git clone <your-repo-url>"
    echo "cd email-management"
    echo "pip install -r requirements.txt"
    echo "python main.py"
}

# Show menu
echo ""
echo "Select deployment option:"
echo "1) Elastic Beanstalk (Recommended - Easy)"
echo "2) App Runner (Serverless)"
echo "3) Lightsail (VPS)"
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        deploy_to_elastic_beanstalk
        ;;
    2)
        deploy_to_app_runner
        ;;
    3)
        deploy_to_lightsail
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac

echo "🎉 Deployment process started!"
echo "📊 Check AWS Console for deployment status"