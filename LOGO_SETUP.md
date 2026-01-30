# Logo Setup Guide

## How to Add Your Own Logo

Your website now supports a custom logo image instead of the Japanese kanji character.

### Steps to Add Your Logo:

1. **Prepare Your Logo Image**
   - Supported formats: PNG, JPG, SVG (SVG recommended for best quality)
   - Recommended size: 200-400px height for best display
   - Make sure the background is transparent if using PNG/SVG

2. **Add Your Logo to the Project**
   - Place your logo file in the `/public/images/` directory
   - Name it `logo.png` (or `logo.svg`, `logo.jpg`, etc.)

3. **Update the Code** (if using a different filename)
   - Open `/src/App.vue`
   - Find line 7: `<img src="/images/logo.png" alt="Logo" class="logo-image" />`
   - Change `logo.png` to your filename (e.g., `logo.svg`)

### Temporary Logo

Currently, the website references `/images/logo.png` which doesn't exist yet. You have two options:

**Option 1: Add Your Logo**
- Follow the steps above to add your own logo

**Option 2: Use Text Only (Remove Logo Image Temporarily)**
- Open `/src/App.vue`
- Comment out or delete line 7-8:
  ```vue
  <!-- <img src="/images/logo.png" alt="Logo" class="logo-image" /> -->
  ```
- This will show just your name until you add a logo

### Logo Styling

The logo is styled to be 2.5rem (40px) tall on desktop and 2rem (32px) on mobile. If you want to adjust the size:

1. Open `/src/App.vue`
2. Find the `.logo-image` class (around line 87)
3. Change the `height` value to your preference

### Example Logo Sources

If you need a logo created:
- **Canva**: Free logo maker at canva.com
- **Logo.com**: AI-powered logo generator
- **Figma**: Free design tool for custom logos
- **Hire a designer**: Fiverr or similar platforms

---

**Note**: After making changes, restart your development server (`npm run dev`) to see the updates.
