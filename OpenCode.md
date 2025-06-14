# OpenCode Memory for ByteCrash Blog

## Build Commands
- **Development server**: `hugo server --minify --gc --disableFastRender`
- **Production build**: `hugo --minify`
- **Build with drafts**: `hugo server -D`

## Content Creation
- **New post**: `hugo new content/posts/post-name/index.md`
- **New page**: `hugo new content/page-name.md`

## Theme Management
- **Current theme**: Hugo Terminal (`hugo-theme-terminal`) with green color variant
- **Custom styling**: Green theme override in `static/style.css`
- **Update theme**: `git submodule update --remote --merge`
- **Initialize submodules**: `git submodule update --init --recursive`

## Deployment Settings (Cloudflare Pages)
- **Framework preset**: Hugo
- **Build command**: `hugo --minify`
- **Output directory**: `public`
- **Environment variables**: 
  - `HUGO_VERSION=0.142.0`
  - `HUGO_EXTENDED=true`
- **Production branch**: `main`
- **Note**: No deploy command needed (Cloudflare handles this automatically)

## Project Structure
- Content in `content/posts/` (posts) and `content/` (pages)
- Theme as Git submodule in `themes/hugo-theme-terminal`
- Configuration in `hugo.toml`
- Static assets in `assets/` and `static/`

## Code Style Preferences
- Use `draft: false` for published content
- Include `description`, `tags`, and `categories` in front matter
- Use `index.md` for posts with resources (images, etc.)
- Keep content organized in language-specific directories