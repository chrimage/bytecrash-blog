# Cloudflare Pages Deployment Guide

## 🚀 Setting up Cloudflare Pages

### Step 1: Create Pages Project

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com) → **Pages**
2. Click **"Create a project"**
3. Select **"Connect to Git"**
4. Choose **GitHub** and authorize Cloudflare
5. Select the repository: `chrimage/bytecrash-blog`

### Step 2: Configure Build Settings

| Setting | Value |
|---------|-------|
| **Project name** | `bytecrash-blog` |
| **Production branch** | `main` |
| **Framework preset** | Hugo |
| **Build command** | `hugo --minify` |
| **Build output directory** | `public` |

### Step 3: Environment Variables

Add these environment variables in the **Settings** tab:

| Variable | Value |
|----------|-------|
| `HUGO_VERSION` | `0.142.0` |
| `HUGO_EXTENDED` | `true` |

### Step 4: Deploy

1. Click **"Save and Deploy"**
2. Wait for the first build to complete
3. Your site will be available at: `https://bytecrash-blog.pages.dev`

### Step 5: Custom Domain Setup

1. In your Pages project, go to **Custom domains**
2. Click **"Set up a custom domain"**
3. Enter: `blog.bytecrash.xyz`
4. Follow the DNS setup instructions:
   - Add a CNAME record pointing `blog` to `bytecrash-blog.pages.dev`
   - Or add an AAAA record if using apex domain
5. Wait for SSL certificate to be issued (usually 2-5 minutes)

## 🔧 Verification Steps

After deployment, verify:

- [ ] Site builds successfully (check build logs)
- [ ] Site is accessible at `https://bytecrash-blog.pages.dev`
- [ ] Custom domain `blog.bytecrash.xyz` resolves correctly
- [ ] SSL certificate is active (green lock icon)
- [ ] All pages load correctly (Home, Posts, About)
- [ ] RSS feed is accessible at `/index.xml`

## 🚨 Troubleshooting

### Build Failures
- **Hugo Extended Error**: Ensure `HUGO_EXTENDED=true` environment variable is set
- Check Hugo version matches local (`0.142.0`)
- Verify submodules are properly initialized
- Check build logs for specific errors

**Common Fix for SCSS/Image Processing Errors:**
1. Go to Pages project → Settings → Environment variables
2. Add: `HUGO_EXTENDED` = `true`
3. Redeploy the project

### DNS Issues
- Ensure CNAME record is properly configured
- Wait up to 24 hours for DNS propagation
- Use `dig blog.bytecrash.xyz` to verify DNS resolution

### SSL Certificate Issues
- Wait 5-10 minutes after DNS setup
- Try disabling/re-enabling SSL in Cloudflare
- Contact Cloudflare support if issues persist

## 📊 Performance Expectations

With Cloudflare Pages, you should see:
- **Build time**: ~30-60 seconds
- **Global CDN**: Content served from 200+ locations
- **Lighthouse score**: 95+ (mobile/desktop)
- **First Contentful Paint**: <1.5s globally

## 🔄 Automatic Deployments

Once configured:
- **Production**: Pushes to `main` branch trigger automatic deployment
- **Preview**: Pull requests create preview deployments
- **Rollback**: Easy rollback to previous deployments via dashboard

Repository URL: https://github.com/chrimage/bytecrash-blog