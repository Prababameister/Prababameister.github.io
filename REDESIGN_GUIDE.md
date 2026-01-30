# Setup Guide for Japanese-Inspired Portfolio

## What's New

Your portfolio has been completely redesigned with:
- 🎨 Japanese-inspired aesthetic (fonts, colors, decorative elements)
- 🖼️ Color palette from "Geishas in a Landscape" artwork
- 📸 Profile photo on home page with intro blurb section
- 💼 Combined Work page (projects + experience together)
- 📄 Resume download section
- ◆ Decorative kanji character in logo

## Quick Start

### 1. Add Your Profile Photo

Place your profile photo in the `public/images/` folder:
```
public/images/profile.jpg  ← Your photo here (recommended: 300x300px or square aspect ratio)
```

The site will show a placeholder if no image is found.

### 2. Add Your Resume PDF

Place your resume in the `public/resume/` folder:
```
public/resume/prabhvir-babra-resume.pdf  ← Your resume here
```

### 3. Customize Your Intro Blurb

Edit `src/views/Home.vue` and find the intro blurb section (around line 22):

```vue
<div class="intro-blurb">
  <p>
    [Replace with your personal introduction...]
  </p>
  <p>
    [Add another paragraph about your goals...]
  </p>
</div>
```

Write 2-3 paragraphs about:
- Your passion for robotics
- What drives you
- Your unique perspective
- Your goals and aspirations

### 4. Install and Run

```bash
cd portfolio-site
npm install
npm run dev
```

Visit http://localhost:5173

## Design Details

### Color Palette (from Geisha artwork)

The site uses these colors extracted from the artwork:
- **Primary Red:** `#c73838` - Rich crimson from the artwork
- **Secondary Teal:** `#2c6b6f` - Deep teal from landscape
- **Soft Green:** `#8faa88` - Foliage green
- **Cream Background:** `#f5ede4` - Paper-like beige
- **Gold Accent:** `#c9a961` - Warm gold tones

### Typography

- **Headings:** Noto Serif JP (Japanese serif font)
- **Body:** Noto Sans JP (Japanese sans-serif font)
- Both fonts are loaded from Google Fonts automatically

### Japanese-Inspired Elements

- **Kanji logo:** 婆 character in the header
- **Wave dividers:** Traditional Japanese wave patterns
- **Diamond decorations:** ◆ symbols on page titles
- **Border patterns:** Gradient stripes inspired by traditional designs
- **Card styling:** Clean lines with accent borders

## Customization

### Change the Kanji Character

Edit `src/App.vue` line 6:
```vue
<span class="logo-kanji">婆</span>  ← Change this character
```

Pick a kanji that represents you or your work.

### Adjust Colors

Edit `src/assets/style.css` starting at line 9:
```css
:root {
  --primary-color: #c73838;    /* Change these */
  --secondary-color: #2c6b6f;
  /* etc... */
}
```

### Update Content

- **Home intro:** `src/views/Home.vue`
- **Work content:** `src/views/Work.vue`
- **Contact info:** `src/views/Contact.vue`

## Page Structure

### Home Page
- Profile photo + intro blurb
- Social links (GitHub, LinkedIn, Email)
- Three highlight cards

### Work Page
- Tabs: Current Work / Past Work
- Experience timeline with your roles
- Projects grid (clickable for modals)
- Each project can have images and videos

### Contact Page
- Contact cards (email, GitHub, LinkedIn, phone)
- Resume download button
- About section with technical skills

## Adding Images and Videos

### For Projects

Follow the same process as before - see `ADDING_MEDIA.md`:
- Add images to `public/images/`
- Add videos to `public/videos/` or use YouTube
- Update project data in `src/views/Work.vue`

### For Profile

- Recommended size: 300x300px (square)
- Formats: JPG, PNG, WebP
- Name it `profile.jpg` and place in `public/images/`

## Deployment

Same as before:

1. Update `vite.config.js` with your repo name
2. Run `npm run deploy`
3. Enable GitHub Pages in repo settings

## File Structure

```
portfolio-site/
├── public/
│   ├── images/
│   │   └── profile.jpg          ← Add your photo
│   └── resume/
│       └── your-resume.pdf      ← Add your resume
├── src/
│   ├── views/
│   │   ├── Home.vue             ← Profile + intro
│   │   ├── Work.vue             ← Projects + experience
│   │   └── Contact.vue          ← Contact + resume
│   ├── App.vue                  ← Navigation bar
│   └── assets/
│       └── style.css            ← Colors + fonts
└── ...
```

## Tips

1. **Profile Photo:**
   - Use a professional headshot
   - Square aspect ratio works best
   - Compress before uploading (use TinyPNG)

2. **Intro Blurb:**
   - Be authentic and personal
   - 2-3 paragraphs is ideal
   - Talk about what makes you unique

3. **Resume:**
   - Keep it updated
   - Use the same filename in the code
   - PDF format only

4. **Colors:**
   - The current palette is warm and earthy
   - Change colors in `style.css` if you want different tones
   - Keep good contrast for readability

5. **Kanji:**
   - Make sure it's appropriate and meaningful
   - You can use your name in kanji if you have one
   - Or use a character that represents your values

## Troubleshooting

**Profile photo not showing?**
- Check the file is named `profile.jpg`
- Make sure it's in `public/images/`
- Try clearing browser cache

**Resume download not working?**
- Verify the PDF is in `public/resume/`
- Check the filename matches in Contact.vue
- Make sure the path starts with `/resume/`

**Fonts look wrong?**
- Check your internet connection (fonts load from Google)
- Try clearing browser cache
- Fallback fonts will load if Google Fonts fails

## Next Steps

1. Add your profile photo
2. Write your intro blurb
3. Upload your resume PDF
4. Test everything locally
5. Deploy to GitHub Pages!

Enjoy your new Japanese-inspired portfolio! 🎌
