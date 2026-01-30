# Quick Setup Guide for GitHub Pages

## Step 1: Create GitHub Repository

1. Go to GitHub and create a new repository
2. Name it something like `portfolio-site` or `yourname.github.io`
3. Make it public
4. Don't initialize with README (we already have one)

## Step 2: Update Configuration

Open `vite.config.js` and change line 6:

```javascript
base: '/portfolio-site/', // Change to YOUR repository name
```

**Important:** If your repo is named `username.github.io`, use `base: '/'`

## Step 3: Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

## Step 4: Deploy to GitHub Pages

### Option A: Using npm (Recommended)

```bash
npm install
npm run deploy
```

### Option B: Using deploy script

Update `deploy.sh` with your GitHub username and repo name, then:

```bash
./deploy.sh
```

## Step 5: Enable GitHub Pages

1. Go to your repo on GitHub
2. Click Settings → Pages
3. Under "Source", select branch: `gh-pages`
4. Click Save

Your site will be live in a few minutes at:
`https://YOUR_USERNAME.github.io/YOUR_REPO/`

## Customization Checklist

- [ ] Update `vite.config.js` with your repo name
- [ ] Edit `src/views/Home.vue` with your intro
- [ ] Update projects in `src/views/Projects.vue`
- [ ] Update experience in `src/views/Experience.vue`
- [ ] Update contact info in `src/views/Contact.vue`
- [ ] Change colors in `src/assets/style.css` (optional)

## Local Development

To see changes locally before deploying:

```bash
npm install
npm run dev
```

Visit `http://localhost:5173`

## Troubleshooting

**CSS/JS not loading?**
- Make sure `base` in `vite.config.js` matches your repo name exactly
- Repo name `my-site` needs `base: '/my-site/'`
- Username repo `user.github.io` needs `base: '/'`

**404 Page?**
- Check GitHub Pages settings are pointing to `gh-pages` branch
- Make sure you ran `npm run deploy` successfully
- Wait a few minutes for deployment to complete

**Want to update?**
1. Make changes to your code
2. Run `npm run deploy` again
3. Changes will appear in a few minutes
