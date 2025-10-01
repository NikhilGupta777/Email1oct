#!/bin/bash

# Universal Deployment Script
# Supports: Render, Railway, Fly.io, AWS

set -e

echo "🚀 Universal Deployment Script"
echo "=============================="
echo ""
echo "Available platforms:"
echo "1) Render.com (⭐ RECOMMENDED - Best free tier)"
echo "2) Railway.app (Easy, small cost for DB)"
echo "3) Fly.io (Good free tier)"
echo "4) AWS (Multiple options)"
echo "5) Local development"
echo ""

read -p "Select platform (1-5): " platform

case $platform in
    1)
        echo "🎨 Deploying to Render.com..."
        echo ""
        echo "Steps:"
        echo "1. Go to https://render.com"
        echo "2. Sign up/Login"
        echo "3. Click 'New +' -> 'Blueprint'"
        echo "4. Connect your GitHub repository"
        echo "5. Render will auto-detect Python/FastAPI"
        echo "6. Add environment variables in Render dashboard"
        echo "7. Deploy!"
        echo ""
        echo "📝 Required environment variables:"
        echo "- DATABASE_URL (Render provides PostgreSQL)"
        echo "- SENDGRID_API_KEY"
        echo "- JWT_SECRET"
        echo "- GOOGLE_CLIENT_ID (optional)"
        echo "- GOOGLE_CLIENT_SECRET (optional)"
        echo "- PERPLEXITY_API_KEY (optional)"
        echo ""
        read -p "Press Enter to open Render.com..." dummy
        python -m webbrowser https://render.com || echo "Open https://render.com manually"
        ;;

    2)
        echo "🚂 Deploying to Railway.app..."
        echo ""
        echo "Steps:"
        echo "1. Go to https://railway.app"
        echo "2. Sign up/Login with GitHub"
        echo "3. Click 'New Project'"
        echo "4. Choose 'Deploy from GitHub repo'"
        echo "5. Select your repository"
        echo "6. Add PostgreSQL database"
        echo "7. Set environment variables"
        echo "8. Deploy!"
        echo ""
        echo "💰 Cost: ~$5/month for database"
        echo ""
        read -p "Press Enter to open Railway.app..." dummy
        python -m webbrowser https://railway.app || echo "Open https://railway.app manually"
        ;;

    3)
        echo "🪁 Deploying to Fly.io..."
        echo ""
        echo "Prerequisites: Install Fly CLI"
        echo "curl -L https://fly.io/install.sh | sh"
        echo ""
        echo "Steps:"
        echo "1. fly launch"
        echo "2. Select region"
        echo "3. Add PostgreSQL database"
        echo "4. Set environment variables"
        echo "5. fly deploy"
        echo ""
        echo "💰 Free tier: 3GB RAM, 3x VMs"
        echo ""
        read -p "Would you like to run 'fly launch' now? (y/n): " run_fly
        if [ "$run_fly" = "y" ]; then
            fly launch
        fi
        ;;

    4)
        echo "☁️ AWS Deployment Options:"
        echo "1) Elastic Beanstalk (Easiest)"
        echo "2) App Runner (Serverless)"
        echo "3) Lightsail (VPS)"
        read -p "Select AWS option (1-3): " aws_option

        case $aws_option in
            1)
                echo "📦 Deploying to Elastic Beanstalk..."
                chmod +x deploy-aws.sh
                ./deploy-aws.sh
                ;;
            2)
                echo "🏃 Deploying to App Runner..."
                echo "Manual setup required via AWS Console"
                echo "Or use: aws apprunner create-service --cli-input-json file://aws-app-runner-config.json"
                ;;
            3)
                echo "💡 Deploying to Lightsail..."
                echo "Manual setup required via AWS Console"
                ;;
        esac
        ;;

    5)
        echo "💻 Local Development Setup:"
        echo ""
        echo "1. Install dependencies:"
        echo "   pip install -r requirements.txt"
        echo ""
        echo "2. Set up environment variables:"
        echo "   cp .env.example .env"
        echo "   # Edit .env with your configuration"
        echo ""
        echo "3. Run the application:"
        echo "   python main.py"
        echo ""
        echo "4. Access the application:"
        echo "   Frontend: http://localhost:8000"
        echo "   API Docs: http://localhost:8000/docs"
        echo ""
        read -p "Would you like to run the app now? (y/n): " run_local
        if [ "$run_local" = "y" ]; then
            python main.py
        fi
        ;;

    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac

echo ""
echo "🎉 Deployment process initiated!"
echo "📊 Check the respective platform's dashboard for status"
echo ""
echo "Need help? Check the README.md for detailed instructions"