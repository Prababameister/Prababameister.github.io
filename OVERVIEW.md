# Vue.js Portfolio Website - Complete Package

## What You Got

A fully functional, modern portfolio website built with Vue.js 3 + Vite, ready to deploy to GitHub Pages in minutes!

## Features

✅ **4 Complete Pages:**
- Home (Hero section with highlights)
- Projects (Your robot arm, kiwi drive, and vision system)
  - **NEW:** Past/Present project tabs
  - **NEW:** Clickable cards with modal popups
  - **NEW:** Support for images and videos
- Experience (RoMeLa, 3D4E, FRC)
- Contact (All your contact info + skills)

✅ **Modern Tech Stack:**
- Vue.js 3 (Composition API ready)
- Vue Router (client-side routing)
- Vite (lightning-fast builds)
- Responsive CSS (works on all devices)

✅ **Pre-populated with YOUR Info:**
- All content from your resume already added
- Your GitHub, LinkedIn, email included
- Projects and experience sections complete

✅ **GitHub Pages Ready:**
- Deployment scripts included
- Configuration files ready
- Step-by-step guides provided

## Quick Start (5 minutes to live site!)

### 1. Install Dependencies
```bash
cd portfolio-site
npm install
```

### 2. Update Config
Edit `vite.config.js` line 6:
```javascript
base: '/your-repo-name/',  // Change this!
```

### 3. Test Locally
```bash
npm run dev
```
Visit http://localhost:5173

### 4. Deploy to GitHub Pages
```bash
npm run deploy
```

### 5. Enable GitHub Pages
- Go to repo Settings → Pages
- Select `gh-pages` branch
- Save

Done! Site will be live at `https://yourusername.github.io/your-repo/`

## What to Customize Later

### Easy Changes:
- **Colors**: Edit `src/assets/style.css` (lines 6-11)
- **Content**: Update text in `src/views/` files
- **Projects**: Edit the `projects` array in `Projects.vue`
- **Experience**: Edit the `experiences` array in `Experience.vue`
- **Media**: See `ADDING_MEDIA.md` for adding images/videos to projects

### Adding Features:
- New pages: Create in `src/views/` and add to router
- Components: Add reusable components in `src/components/`
- Images: Put in `public/` folder
- Blog: Add a new route + view component

## File Structure

```
portfolio-site/
├── src/
│   ├── views/          ← Your pages (Home, Projects, etc.)
│   ├── router/         ← Navigation config
│   ├── assets/         ← Styles
│   ├── App.vue         ← Main layout with navbar
│   └── main.js         ← Entry point
├── vite.config.js      ← Build config (UPDATE THIS!)
├── package.json        ← Dependencies
├── README.md           ← Full documentation
├── SETUP.md            ← Quick setup guide
└── deploy.sh           ← Alternative deployment script
```

## Deployment Options

### Option 1: npm command (Easiest)
```bash
npm run deploy
```

### Option 2: Manual script
```bash
./deploy.sh  # After updating with your repo info
```

### Option 3: GitHub Actions (Advanced)
You can set up automated deployment with GitHub Actions later if you want CI/CD.

## Troubleshooting

**Site shows 404 or broken links?**
→ Check `base:` in `vite.config.js` matches your repo name exactly

**Styles not loading?**
→ Same as above, plus clear browser cache

**Deploy fails?**
→ Make sure you've committed your code to GitHub first
→ Check you have write permissions to the repo

## Next Steps

1. **Customize content** - Update with your latest projects
2. **Add images** - Consider adding project screenshots
3. **SEO** - Add meta tags in `index.html`
4. **Analytics** - Add Google Analytics if needed
5. **Blog** - Add a blog section for writeups
6. **Dark mode** - Easy to add with CSS variables

## Resources

- **Vue.js Docs**: https://vuejs.org
- **Vite Docs**: https://vitejs.dev
- **GitHub Pages**: https://pages.github.com

## Support Files Included

- `README.md` - Complete documentation
- `SETUP.md` - Step-by-step deployment guide
- `ADDING_MEDIA.md` - Guide for adding images/videos to projects
- `.gitignore` - Proper git configuration
- `deploy.sh` - Bash deployment script

Everything is ready to go! Just install, customize, and deploy. 🚀
