# 🚨 Cloudflare Pages Build Fix

## Issue: Hugo Extended Error

If you see this error in Cloudflare Pages build logs:
```
ERROR TOCSS: failed to transform "style.scss" (text/x-scss). Check your Hugo installation; you need the extended version to build SCSS/SASS
```

## ✅ Solution

1. **Go to Cloudflare Pages Dashboard**
2. **Select your project** (`bytecrash-blog`)
3. **Go to Settings → Environment variables**
4. **Add these variables:**

| Variable Name | Value |
|---------------|-------|
| `HUGO_VERSION` | `0.142.0` |
| `HUGO_EXTENDED` | `true` |

5. **Save the variables**
6. **Go to Deployments tab**
7. **Click "Retry deployment" on the latest build**

## ✅ Verification

After adding `HUGO_EXTENDED=true`, you should see in the build logs:
```
✅ Detected the following tools from environment: nodejs@20.19.2, hugo@0.142.0
✅ Start building sites …
✅ Total in XXX ms
✅ Success: Finished building
```

## 🔄 Alternative: Manual Redeploy

If the environment variables don't take effect:
1. Make a small commit (add a space to README)
2. Push to trigger a new build
3. The new build will use Hugo Extended

## 📞 Still Having Issues?

Check the [Cloudflare Pages Hugo documentation](https://developers.cloudflare.com/pages/framework-guides/deploy-a-hugo-site/) for the latest requirements.