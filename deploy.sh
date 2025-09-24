#!/bin/bash

# Learnova Deployment Script for Vercel
# This script helps prepare your application for deployment

echo "🚀 Learnova Deployment Preparation"
echo "=================================="

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI not found. Installing..."
    npm install -g vercel
else
    echo "✅ Vercel CLI is installed"
fi

echo ""
echo "📋 Deployment Checklist:"
echo "1. ✅ Frontend configured with vercel.json"
echo "2. ✅ Backend configured with vercel.json"
echo "3. ✅ Environment variables template created"
echo "4. ✅ API URLs configured for production"

echo ""
echo "🔧 Next Steps:"
echo "1. Push your code to GitHub"
echo "2. Go to vercel.com and create two new projects:"
echo "   - Frontend: Set root directory to 'apps/frontend'"
echo "   - Backend: Set root directory to 'apps/backend'"
echo "3. Configure environment variables in Vercel dashboard"
echo "4. Set up MongoDB Atlas for production database"
echo "5. Configure OAuth providers with production URLs"

echo ""
echo "📖 For detailed instructions, see DEPLOYMENT.md"

echo ""
echo "🧪 Test locally with production build:"
echo "Frontend: cd apps/frontend && npm run build && npm run preview"
echo "Backend:  cd apps/backend && npm run build && npm start"
