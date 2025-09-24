# Learnova Deployment Guide for Vercel

## Overview
This guide will help you deploy your Learnova application to Vercel. You'll need to deploy the frontend and backend as separate Vercel projects.

## Prerequisites
1. Vercel account (free tier available)
2. MongoDB Atlas account (for production database)
3. Domain names (optional, Vercel provides free subdomains)

## Step 1: Deploy Frontend

### 1.1 Prepare Frontend
The frontend is already configured with:
- `vercel.json` configuration file
- Vite build settings optimized for production
- Environment variables ready

### 1.2 Deploy to Vercel
1. Go to [vercel.com](https://vercel.com) and sign in
2. Click "New Project"
3. Import your GitHub repository
4. **Important**: Set the Root Directory to `apps/frontend`
5. Vercel will automatically detect it's a Vite project
6. Click "Deploy"

### 1.3 Configure Frontend Environment Variables
In Vercel dashboard, go to your frontend project → Settings → Environment Variables:

```
VITE_API_URL=https://your-backend-app.vercel.app
```

## Step 2: Deploy Backend

### 2.1 Prepare Backend
The backend is configured with:
- `vercel.json` for Node.js deployment
- TypeScript build process
- Express server setup

### 2.2 Deploy to Vercel
1. Create a new Vercel project
2. Import the same GitHub repository
3. **Important**: Set the Root Directory to `apps/backend`
4. Vercel will detect it's a Node.js project
5. Click "Deploy"

### 2.3 Configure Backend Environment Variables
In Vercel dashboard, go to your backend project → Settings → Environment Variables:

```
# Database
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/learnova?retryWrites=true&w=majority

# Session & Security
SESSION_SECRET=your-super-secret-session-key-for-production
JWT_SECRET=your-jwt-secret-for-production

# OpenAI (if using AI features)
OPENAI_API_KEY=your-openai-api-key-here

# Stripe (if using payments)
STRIPE_SECRET_KEY=sk_live_your-stripe-secret-key
STRIPE_WEBHOOK_SECRET=whsec_your-webhook-secret

# URLs (update with your actual Vercel URLs)
FRONTEND_URL=https://your-frontend-app.vercel.app
BACKEND_URL=https://your-backend-app.vercel.app

# Environment
NODE_ENV=production
```

## Step 3: Update Frontend API Configuration

After deploying both apps, update your frontend to use the production API URL:

1. In your frontend Vercel project, add environment variable:
   ```
   VITE_API_URL=https://your-backend-app.vercel.app
   ```

2. Update your frontend code to use the environment variable for API calls.

## Step 4: Configure Custom Domains (Optional)

1. In Vercel dashboard, go to your project → Settings → Domains
2. Add your custom domain
3. Follow Vercel's DNS configuration instructions

## Step 5: Set Up MongoDB Atlas (Production Database)

1. Go to [MongoDB Atlas](https://cloud.mongodb.com)
2. Create a new cluster
3. Create a database user
4. Whitelist Vercel's IP addresses (0.0.0.0/0 for all IPs)
5. Get your connection string and add it to backend environment variables

## Step 6: Configure OAuth Providers (Google/GitHub)

### Google OAuth
1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project or select existing
3. Enable Google+ API
4. Create OAuth 2.0 credentials
5. Add authorized redirect URIs:
   - `https://your-backend-app.vercel.app/api/auth/oauth/google/callback`
6. Add client ID and secret to backend environment variables

### GitHub OAuth
1. Go to GitHub → Settings → Developer settings → OAuth Apps
2. Create new OAuth App
3. Set Authorization callback URL:
   - `https://your-backend-app.vercel.app/api/auth/oauth/github/callback`
4. Add client ID and secret to backend environment variables

## Step 7: Test Your Deployment

1. Visit your frontend URL
2. Test user registration and login
3. Test OAuth login (Google/GitHub)
4. Verify API endpoints are working

## Troubleshooting

### Common Issues:
1. **CORS Errors**: Make sure FRONTEND_URL in backend matches your frontend domain
2. **Database Connection**: Verify MONGO_URI is correct and IP whitelist includes Vercel
3. **OAuth Redirects**: Ensure callback URLs match your production domains
4. **Environment Variables**: Double-check all required variables are set

### Useful Commands:
```bash
# Test backend locally with production build
cd apps/backend
npm run build
npm start

# Test frontend locally with production build
cd apps/frontend
npm run build
npm run preview
```

## Monitoring

1. Use Vercel's built-in analytics
2. Monitor MongoDB Atlas for database performance
3. Set up error tracking (Sentry, LogRocket, etc.)

## Security Checklist

- [ ] Use strong, unique secrets for SESSION_SECRET and JWT_SECRET
- [ ] Enable HTTPS (automatic with Vercel)
- [ ] Configure proper CORS settings
- [ ] Use environment variables for all sensitive data
- [ ] Regularly update dependencies
- [ ] Monitor for security vulnerabilities

## Cost Optimization

- Vercel free tier: 100GB bandwidth, 100 serverless function executions
- MongoDB Atlas free tier: 512MB storage
- Consider upgrading if you exceed free limits

## Support

- Vercel Documentation: https://vercel.com/docs
- MongoDB Atlas Documentation: https://docs.atlas.mongodb.com
- React/Vite Documentation: https://vitejs.dev/guide/
