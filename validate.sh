#!/bin/bash

# ByteCrash Blog - Validation Script
# This script validates the Hugo blog setup and build process

echo "🚀 ByteCrash Blog Validation Script"
echo "=================================="

# Check Hugo version
echo "📋 Checking Hugo version..."
if command -v hugo &> /dev/null; then
    HUGO_VERSION=$(hugo version)
    echo "✅ Hugo found: $HUGO_VERSION"
else
    echo "❌ Hugo not found. Please install Hugo Extended ≥ 0.115"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "hugo.toml" ]; then
    echo "❌ hugo.toml not found. Please run this script from the blog root directory."
    exit 1
fi

# Check theme submodule
echo "📋 Checking theme submodule..."
if [ -d "themes/hugo-theme-terminal" ] && [ -f "themes/hugo-theme-terminal/theme.toml" ]; then
    echo "✅ Theme submodule found"
else
    echo "❌ Theme submodule missing. Run: git submodule update --init --recursive"
    exit 1
fi

# Test build
echo "📋 Testing production build..."
if hugo --minify --quiet; then
    echo "✅ Production build successful"
    
    # Check if public directory was created
    if [ -d "public" ]; then
        echo "✅ Public directory created"
        
        # Check for key files
        if [ -f "public/index.html" ]; then
            echo "✅ Homepage generated"
        else
            echo "❌ Homepage not found"
        fi
        
        if [ -f "public/posts/index.html" ]; then
            echo "✅ Posts page generated"
        else
            echo "❌ Posts page not found"
        fi
        
        if [ -f "public/pages/about/index.html" ]; then
            echo "✅ About page generated"
        else
            echo "❌ About page not found"
        fi
        
        if [ -f "public/index.xml" ]; then
            echo "✅ RSS feed generated"
        else
            echo "❌ RSS feed not found"
        fi
    else
        echo "❌ Public directory not created"
    fi
else
    echo "❌ Production build failed"
    exit 1
fi

# Check content
echo "📋 Checking content..."
POSTS_COUNT=$(find content/posts -name "*.md" -not -name "_index.md" 2>/dev/null | wc -l)
echo "✅ Found $POSTS_COUNT blog post(s)"

PAGES_COUNT=$(find content -maxdepth 1 -name "*.md" -not -name "_index.md" 2>/dev/null | wc -l)
echo "✅ Found $PAGES_COUNT page(s)"

# Git status
echo "📋 Checking Git status..."
if git status --porcelain | grep -q .; then
    echo "⚠️  Uncommitted changes found:"
    git status --short
else
    echo "✅ Working directory clean"
fi

# Remote check
if git remote get-url origin &> /dev/null; then
    REMOTE_URL=$(git remote get-url origin)
    echo "✅ Git remote configured: $REMOTE_URL"
else
    echo "⚠️  No Git remote configured"
fi

echo ""
echo "🎉 Validation complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Set up Cloudflare Pages (see DEPLOYMENT.md)"
echo "   2. Configure custom domain: blog.bytecrash.xyz"
echo "   3. Test the live site"
echo ""
echo "🔗 Repository: https://github.com/chrimage/bytecrash-blog"