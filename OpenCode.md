# OpenCode Memory for ByteCrash Blog

## Build Commands
- **Development server**: `hugo server --minify --gc --disableFastRender`
- **Production build**: `hugo --minify`
- **Build with drafts**: `hugo server -D`

## Content Creation
- **New post**: `hugo new content/en/posts/post-name/index.md`
- **New page**: `hugo new content/en/pages/page-name.md`

## Theme Management
- **Update theme**: `git submodule update --remote --merge`
- **Initialize submodules**: `git submodule update --init --recursive`

## Deployment Settings (Cloudflare Pages)
- **Build command**: `hugo --minify`
- **Output directory**: `public`
- **Environment variable**: `HUGO_VERSION=0.142.0`
- **Production branch**: `main`

## Project Structure
- Content in `content/en/`
- Theme as Git submodule in `themes/hugo-blog-awesome`
- Configuration in `hugo.toml`
- Static assets in `assets/` and `static/`

## Code Style Preferences
- Use `draft: false` for published content
- Include `description`, `tags`, and `categories` in front matter
- Use `index.md` for posts with resources (images, etc.)
- Keep content organized in language-specific directories