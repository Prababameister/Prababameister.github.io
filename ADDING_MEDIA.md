# Adding Images and Videos to Projects

## Quick Guide

Your Projects page now has:
- ✅ Past/Present project tabs
- ✅ Clickable project cards
- ✅ Modal popups with detailed information
- ✅ Support for images and videos

## How to Add Media to Projects

### Step 1: Prepare Your Media Files

**For Images:**
- Place images in the `public/images/` folder
- Recommended formats: `.jpg`, `.png`, `.webp`
- Optimize images before uploading (resize to reasonable dimensions, compress)

**For Videos:**
- Option A: Upload to YouTube and use the link
- Option B: Place video files in `public/videos/` folder

### Step 2: Update Project Data

Open `src/views/Projects.vue` and find the project you want to update in the `projects` array.

#### Adding Images

```javascript
{
  id: 1,
  title: 'BrandonW Robot Arm',
  // ... other fields ...
  images: [
    { 
      url: '/images/robot-arm-overview.jpg', 
      caption: 'Robot arm fully assembled' 
    },
    { 
      url: '/images/robot-arm-gazebo.png', 
      caption: 'Gazebo simulation showing IK solver' 
    },
    { 
      url: '/images/robot-arm-demo.jpg', 
      caption: 'Pick and place task execution' 
    }
  ]
}
```

#### Adding YouTube Videos

```javascript
{
  id: 1,
  title: 'BrandonW Robot Arm',
  // ... other fields ...
  videos: [
    { 
      type: 'youtube', 
      url: 'https://youtube.com/watch?v=YOUR_VIDEO_ID', 
      caption: 'Demo of pick and place capabilities' 
    },
    { 
      type: 'youtube', 
      url: 'https://youtu.be/ANOTHER_VIDEO_ID', 
      caption: 'IK solver in action' 
    }
  ]
}
```

#### Adding Local Videos

```javascript
{
  id: 2,
  title: 'Codename FF',
  // ... other fields ...
  videos: [
    { 
      type: 'local', 
      url: '/videos/kiwi-drive-demo.mp4', 
      caption: 'Omnidirectional movement demonstration' 
    }
  ]
}
```

#### Adding Additional Details

You can also add more detailed text descriptions:

```javascript
{
  id: 1,
  title: 'BrandonW Robot Arm',
  // ... other fields ...
  additionalDetails: `
    This project involved building the complete software stack from scratch.
    <br><br>
    The inverse kinematics solver uses a numerical Jacobian-based approach
    with proper joint limit handling and singularity avoidance.
    <br><br>
    Key challenges included:
    - Ensuring stable control loops
    - Achieving smooth trajectories
    - Reliable hardware communication
  `
}
```

### Step 3: Create the Folders

If they don't exist yet, create these folders:

```bash
mkdir -p public/images
mkdir -p public/videos
```

### Step 4: Add Your Files

Copy your images and videos into the appropriate folders:

```
public/
├── images/
│   ├── robot-arm-overview.jpg
│   ├── robot-arm-gazebo.png
│   └── kiwi-drive-assembly.jpg
└── videos/
    └── demo.mp4
```

## Complete Example

Here's a fully populated project:

```javascript
{
  id: 1,
  title: 'BrandonW Robot Arm',
  date: 'Feb 2024 - Jun 2024',
  status: 'past',
  description: 'Complete software stack for a 6-DOF robot arm.',
  features: [
    'Built full C++/ROS software stack with IK solver',
    'Created COBS-framed UART protocol with 99% reliability',
    'Deployed to physical robot for pick-and-place tasks'
  ],
  tags: ['C++', 'ROS', 'Inverse Kinematics', 'Docker'],
  additionalDetails: `
    This was a comprehensive robotics project covering simulation,
    control theory, and hardware integration.
    <br><br>
    The system achieved sub-centimeter accuracy in Cartesian positioning
    and could execute complex trajectories with smooth motion.
  `,
  images: [
    { url: '/images/arm-assembled.jpg', caption: 'Fully assembled robot arm' },
    { url: '/images/arm-simulation.png', caption: 'Gazebo simulation' },
    { url: '/images/arm-picking.jpg', caption: 'Picking up an object' }
  ],
  videos: [
    { 
      type: 'youtube', 
      url: 'https://youtube.com/watch?v=dQw4w9WgXcQ', 
      caption: 'Full demonstration of capabilities' 
    },
    { 
      type: 'local', 
      url: '/videos/arm-demo.mp4', 
      caption: 'Pick and place routine' 
    }
  ]
}
```

## Adding New Projects

To add a new project (present or past):

```javascript
// In the projects array, add:
{
  id: 4, // Increment the ID
  title: 'Your New Project',
  date: 'Jan 2026 - Present',
  status: 'present', // or 'past'
  description: 'Brief one-line description',
  features: [
    'Key feature 1',
    'Key feature 2',
    'Key feature 3'
  ],
  tags: ['Tag1', 'Tag2', 'Tag3'],
  additionalDetails: `Your detailed description here`,
  images: [
    { url: '/images/project-1.jpg', caption: 'Description' }
  ],
  videos: [
    { type: 'youtube', url: 'https://...', caption: 'Demo' }
  ]
}
```

## Tips

1. **Optimize Images**: Use tools like TinyPNG or Squoosh to compress images
2. **Image Dimensions**: Aim for 1200-1600px width for good quality
3. **Video Size**: Keep local videos under 50MB for fast loading
4. **YouTube**: YouTube embeds are recommended as they don't increase your site size
5. **Alt Text**: The caption field also serves as alt text for accessibility

## Testing

After adding media:

1. Run `npm run dev`
2. Navigate to the Projects page
3. Click on a project card
4. Verify images and videos load correctly
5. Check that captions display properly

## Troubleshooting

**Images not showing?**
- Check that the file path is correct (should start with `/images/`)
- Verify the file is actually in `public/images/`
- Check the browser console for 404 errors

**Videos not playing?**
- For YouTube: Make sure the URL is correct
- For local videos: Check the file is in `public/videos/`
- Ensure video format is web-compatible (MP4 H.264 recommended)

**Modal not scrolling?**
- This is normal if content is short
- Add more content or media to test scrolling behavior
