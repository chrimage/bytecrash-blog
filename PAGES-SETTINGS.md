# ✅ Correct Cloudflare Pages Settings

## Build Configuration

| Setting | Value | Notes |
|---------|-------|-------|
| **Framework preset** | Hugo | Auto-detects Hugo settings |
| **Build command** | `hugo --minify` | Builds the static site |
| **Build output directory** | `public` | Where Hugo outputs files |
| **Deploy command** | `echo "Deployment complete"` | If required by UI |

## Environment Variables

| Variable | Value | Purpose |
|----------|-------|---------|
| `HUGO_VERSION` | `0.142.0` | Matches local version |
| `HUGO_EXTENDED` | `true` | Enables SCSS/image processing |

## ❌ Common Mistakes

- **Don't use**: `npx wrangler deploy` (that's for Workers)
- **Don't set**: Custom deploy commands
- **Don't forget**: Environment variables for Hugo Extended

## ✅ Expected Build Flow

1. **Clone repository** from GitHub
2. **Install Hugo** (version from env var)
3. **Run build command**: `hugo --minify`
4. **Auto-deploy** files from `public/` directory
5. **Site live** at your Pages URL

## 🔧 How to Fix Current Issue

1. Go to your Cloudflare Pages project
2. **Settings → Build & deployments**
3. **Remove any deploy command** (leave blank)
4. **Ensure build command** is `hugo --minify`
5. **Ensure output directory** is `public`
6. **Retry deployment**

The build should now complete successfully and automatically deploy your site!