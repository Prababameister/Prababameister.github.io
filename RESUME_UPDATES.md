# Resume Content Updates

## Summary of Changes

Your website has been updated to reflect the content from your latest resume. Here's what was changed:

---

## 1. Experience Page Updates

**Updated to show only current role:**
- **Robotics and Mechanisms Laboratory (RoMeLa)** - June 2025 - Present
  - Updated achievements to match resume exactly:
    - Improved expert model prediction accuracy by 15% (Isaac Gym, URDF modifications)
    - Trained HiTorque humanoid to withstand 0.5 m/s pushes
    - Increased data collection throughput by 50-70% with batch experiment runner

**Moved to Projects:**
- 3D4E Robotics Track (now listed as a project, not experience)
- FRC 299 Valkyrie Robotics (now part of projects with full details)

---

## 2. Projects Page Updates

**Added/Updated Projects (4 total):**

### Present Projects:
1. **3D4E Robotics Track** (Sep 2025 - Present)
   - Leading 8-person team
   - 3-DOF leg development with IK and motion planning
   - Python/Matplotlib validation

### Past Projects:
2. **BrandonW Robot Arm** (Feb 2024 - Jun 2024)
   - 6-DOF arm with C++/ROS
   - 99% UART reliability with COBS
   - Cartesian control and pick-and-place

3. **Codename FF** (Mar 2024 - Dec 2024)
   - Kiwi drive omnidirectional robot
   - Custom 3D-printed omniwheels
   - COBS serial communication

4. **FRC 299 Valkyrie Robotics - AprilTag Vision** (Nov 2021 - Aug 2023)
   - Software Lead position
   - Multi-camera AprilTag vision system
   - 0.5% message drop rate via UDP
   - ≤10° alignment error
   - Team leadership and training

---

## 3. Contact Page Updates

**Technical Skills Updated:**
- **Languages:** C/C++ (4+ years), Python, JavaScript, R
- **Robotics & RL:** ROS1/2, OpenCV, TensorFlow, Isaac Gym, Gazebo
- **Tools:** Git, Docker, Linux, Arduino, Raspberry Pi

**About Me Section Updated:**
- Added graduation date (Expected March 2028)
- Mentioned AMP framework and Isaac Gym research
- Updated description to reflect current work focus

---

## 4. What Stays the Same

- Home page (still has placeholder intro text - you should customize this)
- Logo system (still needs your logo image)
- Navigation structure
- Overall design and styling
- Contact information (email, GitHub, LinkedIn)

---

## Next Steps

### Required:
1. **Add your logo** to `/public/images/logo.png`
   - See `LOGO_SETUP.md` for instructions
   - Or comment out the logo in `App.vue` temporarily

2. **Customize Home page intro** in `/src/views/Home.vue` (lines 22-32)
   - Replace the placeholder text with your personal introduction
   - Make it authentic and tell your story

3. **Add your resume PDF** to `/public/resume/`
   - Name it `prabhvir-babra-resume.pdf`
   - Or update the link in `Contact.vue` line 76

### Optional:
4. **Add project media** to Projects page
   - Add images to `/public/images/`
   - Add video URLs to project data
   - See `ADDING_MEDIA.md` for instructions

5. **Update profile photo** at `/public/images/profile.jpg` (if desired)

---

## Content Alignment with Resume

✅ Experience section matches resume experience section
✅ Projects section includes all resume projects with accurate dates and details
✅ Technical skills match resume exactly
✅ Education info (graduation date) updated
✅ All quantified metrics from resume preserved (15%, 50-70%, 99%, etc.)

---

## Testing Checklist

- [ ] Run `npm run dev` to start development server
- [ ] Check Experience page shows only RoMeLa position
- [ ] Check Projects page shows all 4 projects
- [ ] Verify "Present Projects" tab shows 3D4E
- [ ] Verify "Past Projects" tab shows other 3 projects
- [ ] Check Contact page shows updated skills
- [ ] Click on project cards to see modal popups work
- [ ] Test all external links (GitHub, LinkedIn, email)

---

## File Changes Made

Modified files:
- `/src/views/Experience.vue` - Updated experience data
- `/src/views/Projects.vue` - Updated all projects data
- `/src/views/Contact.vue` - Updated skills and about section

No changes to:
- `/src/views/Home.vue` - Still needs your personal intro
- `/src/App.vue` - Logo system from previous update
- `/src/router/index.js` - Router from previous update
