# 🚀 Email Management System

A comprehensive email management platform built with FastAPI, featuring user authentication, email campaigns, templates, analytics, and AI-powered email generation.

## ✨ Features

- **🔐 User Authentication**: JWT tokens with Google OAuth integration
- **📧 Email Campaigns**: Create and manage email campaigns with templates
- **📝 Template Management**: Dynamic email templates with SendGrid integration
- **👑 Admin Panel**: Comprehensive admin dashboard for user and system management
- **💬 Chat System**: Real-time messaging between users
- **✅ Email Validation**: Advanced email validation with DNS and SMTP checks
- **🤖 AI Email Generation**: Generate emails using Perplexity AI
- **📊 Analytics**: Comprehensive email analytics and reporting
- **🔒 Security**: Rate limiting, audit logs, and security monitoring

## 🚀 Quick Start

### 💻 Local Development

1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Set up environment variables:**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Run the application:**
   ```bash
   python main.py
   ```

4. **Access the application:**
   - Frontend: http://localhost:8000
   - API Docs: http://localhost:8000/docs

## 🌐 Deployment Options

Choose the deployment option that best fits your needs:

### 🥇 **RENDER.COM** (⭐ **RECOMMENDED** - Best Free Tier)
**Free Tier**: 750 hours/month + PostgreSQL database

**Deploy in 3 minutes:**
1. Go to [render.com](https://render.com) and sign up
2. Click **"New +"** → **"Blueprint"**
3. Connect your **GitHub repository**
4. Render auto-detects Python/FastAPI
5. **Add environment variables** in Render dashboard
6. **Deploy!** 🎉

**Required Environment Variables:**
```bash
DATABASE_URL (provided by Render PostgreSQL)
SENDGRID_API_KEY
JWT_SECRET
ALLOWED_ORIGINS=https://your-app.onrender.com
BASE_URL=https://your-app.onrender.com
```

---

### 🚂 **RAILWAY.APP** (Easy, Small Cost)
**Cost**: ~$5/month for database

**Deploy in 2 minutes:**
1. Go to [railway.app](https://railway.app) and sign up with GitHub
2. Click **"New Project"**
3. Choose **"Deploy from GitHub repo"**
4. Select your repository
5. Add **PostgreSQL database**
6. Set **environment variables**
7. **Deploy!** 🚀

---

### 🪁 **FLY.IO** (Good Free Tier)
**Free Tier**: 3GB RAM across 3 VMs

**Deploy with CLI:**
```bash
# Install Fly CLI
curl -L https://fly.io/install.sh | sh

# Deploy
fly launch
fly deploy
```

---

### ☁️ **AWS** (Multiple Options)

#### Option A: Elastic Beanstalk (Easiest AWS)
```bash
# Make script executable and run
chmod +x deploy-aws.sh
./deploy-aws.sh
```

#### Option B: App Runner (Serverless)
```bash
aws apprunner create-service --cli-input-json file://aws-app-runner-config.json
```

#### Option C: Lightsail (VPS)
Manual setup via AWS Console (free tier available)

---

### 🎯 **One-Click Deploy** (Easiest Option)
```bash
# Run the universal deployment script
chmod +x deploy-all.sh
./deploy-all.sh
```

## 🔧 Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABASE_URL` | PostgreSQL connection string | ✅ Yes |
| `SENDGRID_API_KEY` | SendGrid API key for email sending | ✅ Yes |
| `JWT_SECRET` | Secret key for JWT token generation | ✅ Yes |
| `GOOGLE_CLIENT_ID` | Google OAuth client ID | ❌ No |
| `GOOGLE_CLIENT_SECRET` | Google OAuth client secret | ❌ No |
| `PERPLEXITY_API_KEY` | Perplexity API key for AI features | ❌ No |
| `ALLOWED_ORIGINS` | Comma-separated list of allowed origins | ✅ Yes |
| `BASE_URL` | Base URL of the application | ✅ Yes |

## 📋 Production Checklist

### ✅ **Pre-Deployment**
- [ ] Update `requirements.txt` (✅ Already done)
- [ ] Set up environment variables
- [ ] Test locally: `python main.py`
- [ ] Choose deployment platform

### ✅ **Post-Deployment**
- [ ] Verify app is running
- [ ] Test email sending
- [ ] Check database connection
- [ ] Set up domain (optional)
- [ ] Configure monitoring

## 🔗 **API Documentation**

Once deployed, access the interactive API documentation at:
- **Render**: `https://your-app.onrender.com/docs`
- **Railway**: `https://your-app.railway.app/docs`
- **Fly.io**: `https://your-app.fly.dev/docs`
- **AWS**: `https://your-domain.com/docs`

## 🆘 **Troubleshooting**

### **Common Issues:**

**❌ "DATABASE_URL not found"**
- Ensure PostgreSQL is added to your service
- Check environment variables are set correctly

**❌ "SendGrid API key invalid"**
- Verify API key has "Mail Send" permissions
- Check sender email is verified in SendGrid

**❌ "Port already in use"**
- Change port in environment variables
- Kill existing process: `lsof -ti:8000 | xargs kill`

### **Get Help:**
1. Check platform logs/dashboard
2. Verify all environment variables
3. Test database connection
4. Validate SendGrid configuration

## 💰 **Cost Comparison**

| Platform | Free Tier | Cost/Month | Ease of Use |
|----------|-----------|------------|-------------|
| **Render.com** | ⭐ **750 hours + DB** | $7 | ⭐⭐⭐⭐⭐ |
| Railway.app | 100 hours | $5 (DB only) | ⭐⭐⭐⭐⭐ |
| Fly.io | 3GB RAM | $0-10 | ⭐⭐⭐⭐ |
| AWS | 12 months | $0-10 | ⭐⭐⭐ |

## 🔒 **Security Features**

- ✅ Rate limiting on all endpoints
- ✅ JWT token authentication
- ✅ Password hashing with bcrypt
- ✅ CORS protection
- ✅ Input validation and sanitization
- ✅ Audit logging
- ✅ Security event monitoring

## 📈 **Performance**

- ⚡ **Ultra-fast email validation** with caching
- 🚀 **Async email sending** with SendGrid
- 💾 **Optimized database queries** with SQLAlchemy
- 🔄 **Real-time chat** with WebSocket support
- 📊 **Comprehensive analytics** dashboard

## 🛠️ **Tech Stack**

- **Backend**: FastAPI (Python)
- **Database**: PostgreSQL
- **Email Service**: SendGrid
- **Authentication**: JWT + OAuth2
- **AI**: Perplexity API
- **Frontend**: Vanilla HTML/CSS/JS
- **Deployment**: Multi-platform support

## 📝 **License**

This project is private and not licensed for public use.

---

## 🎯 **Next Steps**

1. **Choose your deployment platform** (Render.com recommended)
2. **Set up environment variables**
3. **Deploy and test**
4. **Customize for your needs**

**Ready to deploy?** 🚀
```bash
./deploy-all.sh
```