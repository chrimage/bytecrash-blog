# ByteCrash Blog

A fast, minimal Hugo blog built with the [Hugo Terminal](https://github.com/panr/hugo-theme-terminal) theme and deployed on Cloudflare Pages.

## 🚀 Quick Start

### Prerequisites

- **Hugo Extended** ≥ 0.90 ([installation guide](https://gohugo.io/installation/))
- **Git** with submodule support
- **Node.js** (optional, for additional tooling)

### Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd bytecrash-blog
   ```

2. **Initialize theme submodule**
   ```bash
   git submodule update --init --recursive
   ```

3. **Start the development server**
   ```bash
   hugo server --minify --gc --disableFastRender
   ```

4. **Visit your site**
   Open [http://localhost:1313](http://localhost:1313) in your browser

### Creating Content

- **New post**: `hugo new posts/my-post.md`
- **New page**: `hugo new about.md`

Remember to set `draft: false` in the front matter when ready to publish.

## 🔧 Configuration

The site configuration is in `hugo.toml`. Key settings include:

- **baseURL**: Set to `https://blog.bytecrash.xyz/`
- **title**: "ByteCrash Blog"
- **theme**: "hugo-theme-terminal"
- **Terminal theme**: Retro, minimal design with syntax highlighting

## 🎨 Theme Updates

To update the Hugo Terminal theme:

```bash
git submodule update --remote --merge
git commit -am "chore(theme): bump Terminal theme to latest"
git push
```

## 🚀 Deployment

This site is automatically deployed to Cloudflare Pages with the following settings:

| Setting | Value |
|---------|-------|
| **Production branch** | `main` |
| **Build command** | `hugo --minify` |
| **Output directory** | `public` |
| **Deploy command** | `echo "Deployment complete"` | *(if required)* |
| **Environment variables** | `HUGO_VERSION=0.142.0`, `HUGO_EXTENDED=true` |

### Manual Build

To build the site locally for production:

```bash
hugo --minify
```

The generated site will be in the `public/` directory.

## 📁 Project Structure

```
bytecrash-blog/
├── content/                # Content files
│   ├── posts/             # Blog posts
│   └── about.md           # About page
├── themes/                # Theme submodule
├── assets/                # Images, custom CSS/JS
├── static/                # Static files (copied as-is)
├── hugo.toml              # Site configuration
└── README.md              # This file
```

## 🛠️ Development Commands

| Command | Description |
|---------|-------------|
| `hugo server` | Start development server |
| `hugo server -D` | Include draft content |
| `hugo --minify` | Build for production |
| `hugo new posts/title.md` | Create new post |

## 📝 Content Guidelines

- Use `draft: false` for published content
- Include `description` in front matter for SEO
- Add relevant `tags` and `categories`
- Posts go in `content/posts/`
- Pages go in `content/`

## 🔗 Links

- **Live Site**: [blog.bytecrash.xyz](https://blog.bytecrash.xyz)
- **Theme Documentation**: [Hugo Terminal](https://github.com/panr/hugo-theme-terminal)
- **Hugo Documentation**: [gohugo.io](https://gohugo.io/)

## 📄 License

Content is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
Theme is licensed under [MIT License](https://github.com/panr/hugo-theme-terminal/blob/master/LICENSE.md).