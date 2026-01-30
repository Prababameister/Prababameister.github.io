# Portfolio Website

A modern, Japanese-inspired portfolio website built with Vue.js 3 and Vite, featuring colors from traditional ukiyo-e artwork.

## Features

- 🎨 Japanese-inspired design with authentic fonts (Noto Serif JP, Noto Sans JP)
- 🖼️ Color palette inspired by "Geishas in a Landscape" artwork
- 📸 Profile photo section with customizable intro blurb
- 📱 Fully responsive (mobile, tablet, desktop)
- ⚡ Fast performance with Vite
- 🧭 Client-side routing with Vue Router
- 💼 Combined Work page showcasing both projects and experience
- 📑 Project organization with Current/Past tabs
- 🖱️ Modal popups with detailed project information
- 📸 Support for images and videos in project details
- 📄 Resume download functionality
- ✨ Smooth animations and decorative Japanese elements (wave dividers, kanji, borders)

## Getting Started

### Prerequisites

- Node.js 16+ and npm

### Installation

1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/portfolio-site.git
cd portfolio-site
```

2. **Add your content** (IMPORTANT - do this before running!)
   - Add profile photo: `public/images/profile.jpg`
   - Add resume PDF: `public/resume/prabhvir-babra-resume.pdf`
   - Edit intro blurb in `src/views/Home.vue`
   - See `REDESIGN_GUIDE.md` for details

3. Install dependencies
```bash
npm install
```

4. Start development server
```bash
npm run dev
```

The site will be available at `http://localhost:5173`

## Deployment to GitHub Pages

### Step 1: Update the base URL

In `vite.config.js`, change the `base` option to match your repository name:

```javascript
export default defineConfig({
  plugins: [vue()],
  base: '/your-repo-name/', // Change this!
})
```

If deploying to `username.github.io`, use `base: '/'`

### Step 2: Deploy

Run the deploy command:

```bash
npm run deploy
```

This will build the site and push it to the `gh-pages` branch.

### Step 3: Configure GitHub Pages

1. Go to your repository on GitHub
2. Navigate to Settings > Pages
3. Under "Source", select the `gh-pages` branch
4. Click Save

Your site will be live at `https://username.github.io/repo-name/`

## Customization

### Essential Setup

1. **Add Profile Photo**
   - Place in `public/images/profile.jpg`
   - Recommended: 300x300px square
   - Formats: JPG, PNG, WebP

2. **Add Resume PDF**
   - Place in `public/resume/prabhvir-babra-resume.pdf`
   - Update filename in `src/views/Contact.vue` if different

3. **Write Your Intro Blurb**
   - Edit `src/views/Home.vue` (around line 22)
   - Replace placeholder text with your personal story
   - 2-3 paragraphs recommended

### Update Content

- `src/views/Home.vue` - Hero section, intro blurb, and highlights
- `src/views/Work.vue` - Projects and experience (combined page)
- `src/views/Contact.vue` - Contact information and resume section

### Customize Design

**Colors** (from Geisha artwork palette):
Edit `src/assets/style.css` (lines 9-18):
```css
--primary-color: #c73838;     /* Rich red */
--secondary-color: #2c6b6f;   /* Teal */
--bg-color: #f5ede4;          /* Cream */
/* etc... */
```

**Kanji Logo Character:**
Edit `src/App.vue` (line 6):
```vue
<span class="logo-kanji">婆</span>  ← Change this
```

**Fonts:**
The site uses Noto Serif JP and Noto Sans JP from Google Fonts.
To change fonts, edit the @import in `src/assets/style.css`

### Add Images and Videos to Projects

See `ADDING_MEDIA.md` for detailed instructions on adding media to your projects.

Quick example in `src/views/Work.vue`:
```javascript
images: [
  { url: '/images/demo.jpg', caption: 'Project demo' }
],
videos: [
  { type: 'youtube', url: 'https://youtube.com/watch?v=...', caption: 'Demo' }
]
```

### Add New Pages

1. Create a new component in `src/views/`
2. Add route in `src/router/index.js`
3. Add navigation link in `src/App.vue`

## Project Structure

```
portfolio-site/
├── public/              # Static assets
│   ├── images/         # Profile photo and project images
│   │   └── profile.jpg (add your photo here!)
│   └── resume/         # Your resume PDF
│       └── prabhvir-babra-resume.pdf (add here!)
├── src/
│   ├── assets/         # CSS and global styles
│   │   └── style.css   # Japanese-inspired styling + colors
│   ├── components/     # Reusable components
│   ├── views/          # Page components
│   │   ├── Home.vue    # Profile + intro blurb
│   │   ├── Work.vue    # Projects + Experience (combined)
│   │   └── Contact.vue # Contact + Resume download
│   ├── router/         # Vue Router config
│   ├── App.vue         # Root component with nav
│   └── main.js         # Entry point
├── index.html
├── vite.config.js
├── package.json
├── REDESIGN_GUIDE.md   # Setup guide for new design
├── ADDING_MEDIA.md     # Guide for images/videos
└── README.md           # This file
```

## Build for Production

```bash
npm run build
```

The production-ready files will be in the `dist/` directory.

## License

MIT License - feel free to use this template for your own portfolio!
