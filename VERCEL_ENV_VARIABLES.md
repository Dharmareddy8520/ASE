# Environment Variables for Backend in Vercel

## Required Environment Variables

Add these environment variables in your Vercel backend project dashboard:

### 🔐 **CRITICAL - Must Have**
```
NODE_ENV=production
PORT=3000
```

### 🗄️ **Database**
```
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/learnova?retryWrites=true&w=majority
```

### 🔒 **Security & Sessions**
```
SESSION_SECRET=your-super-secret-session-key-for-production-make-it-long-and-random
JWT_SECRET=your-jwt-secret-for-production-make-it-long-and-random
```

### 🌐 **URLs (Update with your actual Vercel URLs)**
```
FRONTEND_URL=https://your-frontend-app.vercel.app
BACKEND_URL=https://your-backend-app.vercel.app
```

### 🔑 **OAuth Providers**

#### Google OAuth
```
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret
```

#### GitHub OAuth
```
GITHUB_CLIENT_ID=your-github-client-id
GITHUB_CLIENT_SECRET=your-github-client-secret
```

## Optional Environment Variables

### 🤖 **AI Features (if using)**
```
OPENAI_API_KEY=sk-your-openai-api-key
PINECONE_API_KEY=your-pinecone-api-key
```

### 💳 **Payments (if using Stripe)**
```
STRIPE_SECRET_KEY=sk_live_your-stripe-secret-key
STRIPE_WEBHOOK_SECRET=whsec_your-webhook-secret
```

### ☁️ **Storage (if using Firebase)**
```
FIREBASE_SERVICE_ACCOUNT_JSON={"type":"service_account","project_id":"..."}
```

## How to Add in Vercel

1. Go to your backend project in Vercel dashboard
2. Click **Settings** → **Environment Variables**
3. Add each variable above
4. Make sure to set **Environment** to **Production** for all variables
5. Click **Save**

## Important Notes

- **Never commit real secrets to GitHub**
- Use strong, unique secrets for production
- Update OAuth callback URLs to use your Vercel domains
- Test each OAuth provider after deployment
