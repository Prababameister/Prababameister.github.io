#!/bin/bash

# Deploy script for GitHub Pages
echo "🚀 Building for production..."
npm run build

echo "📦 Preparing deployment..."
cd dist

# Create .nojekyll to bypass Jekyll processing
touch .nojekyll

# Initialize git in dist folder
git init
git add -A
git commit -m 'Deploy to GitHub Pages'

# Force push to gh-pages branch
echo "📤 Deploying to GitHub Pages..."
git push -f git@github.com:YOUR_USERNAME/YOUR_REPO.git main:gh-pages

cd ..
echo "✅ Deployment complete!"
echo "Your site will be available at: https://YOUR_USERNAME.github.io/YOUR_REPO/"
