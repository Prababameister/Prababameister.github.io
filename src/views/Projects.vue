<template>
  <div class="projects">
    <div class="container">
      <h1>Projects</h1>
      
      <!-- Tab Navigation -->
      <div class="tabs">
        <button 
          :class="['tab', { active: activeTab === 'present' }]"
          @click="activeTab = 'present'"
        >
          Present Projects
        </button>
        <button 
          :class="['tab', { active: activeTab === 'past' }]"
          @click="activeTab = 'past'"
        >
          Past Projects
        </button>
      </div>
      
      <!-- Projects Grid -->
      <div class="project-grid">
        <div 
          class="project-card" 
          v-for="project in filteredProjects" 
          :key="project.id"
          @click="openModal(project)"
        >
          <div class="project-header">
            <h3>{{ project.title }}</h3>
            <span class="date">{{ project.date }}</span>
          </div>
          <p class="description">{{ project.description }}</p>
          <ul class="features">
            <li v-for="(feature, idx) in project.features" :key="idx">{{ feature }}</li>
          </ul>
          <div class="tags">
            <span class="tag" v-for="tag in project.tags" :key="tag">{{ tag }}</span>
          </div>
          <div class="click-hint">Click for more details →</div>
        </div>
      </div>
    </div>
    
    <!-- Modal Popup -->
    <transition name="modal-fade">
      <div class="modal-overlay" v-if="selectedProject" @click="closeModal">
        <div class="modal-content" @click.stop>
          <button class="close-btn" @click="closeModal">×</button>
          
          <div class="modal-header">
            <h2>{{ selectedProject.title }}</h2>
            <span class="modal-date">{{ selectedProject.date }}</span>
          </div>
          
          <div class="modal-body">
            <p class="modal-description">{{ selectedProject.description }}</p>
            
            <h3>Key Features</h3>
            <ul class="modal-features">
              <li v-for="(feature, idx) in selectedProject.features" :key="idx">{{ feature }}</li>
            </ul>
            
            <!-- Additional Details Section -->
            <div v-if="selectedProject.additionalDetails">
              <h3>Additional Details</h3>
              <p v-html="selectedProject.additionalDetails"></p>
            </div>
            
            <!-- Images Section -->
            <div v-if="selectedProject.images && selectedProject.images.length" class="media-section">
              <h3>Images</h3>
              <div class="image-grid">
                <img 
                  v-for="(image, idx) in selectedProject.images" 
                  :key="idx"
                  :src="image.url" 
                  :alt="image.caption"
                  class="project-image"
                />
                <p v-for="(image, idx) in selectedProject.images" :key="'caption-' + idx" class="image-caption">
                  {{ image.caption }}
                </p>
              </div>
            </div>
            
            <!-- Videos Section -->
            <div v-if="selectedProject.videos && selectedProject.videos.length" class="media-section">
              <h3>Videos</h3>
              <div class="video-grid">
                <div v-for="(video, idx) in selectedProject.videos" :key="idx" class="video-container">
                  <iframe 
                    v-if="video.type === 'youtube'"
                    :src="getYoutubeEmbed(video.url)"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen
                  ></iframe>
                  <video v-else :src="video.url" controls class="project-video"></video>
                  <p class="video-caption">{{ video.caption }}</p>
                </div>
              </div>
            </div>
            
            <div class="tags">
              <span class="tag" v-for="tag in selectedProject.tags" :key="tag">{{ tag }}</span>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'Projects',
  data() {
    return {
      activeTab: 'present',
      selectedProject: null,
      projects: [
        {
          id: 1,
          title: '3D4E Robotics Track',
          date: 'Sep 2025 - Present',
          status: 'present',
          description: 'Leading an 8-person team to develop a quadruped robot leg with inverse kinematics and motion planning.',
          features: [
            'Coordinated an 8-person team across mechanical, electrical, and software subsystems to create two prototypes of a robot leg for a quadruped',
            'Implemented inverse kinematics and motion planning for 3-DOF legs, validating kinematic models via Python and Matplotlib'
          ],
          tags: [],
          additionalDetails: `

            My goal for this project is to create an affordable quadruped robot with 12 DOF and basic perception. This is meant to be hardware platform which will be RL trained for more versatile gait patterns. However, the first step to this goal is creating a servo-driven quadruped with a basic gait pattern.
            <br><br>
            The team is split into mechanical design, electronics, and software, and as project lead, my main goal is coordinate all of the subteams' work.
            <br><br>
            The 3-DOF per leg is designed for spatial degrees of freedom to allow each leg end-effector a larger task space spatially.
            <br><br>
            My main technical contribution so far is through the inverse kinematics and motion planning. I have computed an analytical solution for the IK and have tested the cubic splines in simulation, by using Matplotlib to visualize joint-angles to end-effector position.
            <br><br>
            I have attached images and videos of the work so far.
            This project is still ongoing so stay tuned :).
          `,
          images: [
            { url: '/portfolio-site/projects/leg_image.png', caption: 'Current version of leg' }
          ],
          videos: []
        },
        {
          id: 2,
          title: 'BrandonW Robot Arm',
          date: 'Feb 2024 - Jun 2024',
          status: 'past',
          description: 'Complete software stack for a 6-DOF robot arm with IK solver, controllers, and hardware integration.',
          features: [
            'Built a full 6-DOF robot arm software stack in C++/ROS, including numerical IK, custom controllers, and COBS-framed UART motor control (99% reliability)',
            'Modeled and validated the arm in URDF and Gazebo, containerizing the workflow with Docker for reproducible development',
            'Deployed Cartesian (x, y, z), yaw-pitch-roll control enabling autonomous pick-and-place with electromagnetic and gripper end-effectors'
          ],
          tags: [],
          additionalDetails: `
            This was a collaboration between myself a friend (Alexander Lupoui). I would handle software and he would handle mechanics.

            My main tasks were inverse kinematics and serial communications.
            <br><br>
            My IK solver used a numerical Jacobian-based approach with joint limit handling. I did this mainly because the forward kinematics yielded some long equations that weren't feasible to analytically solve. Thus, using Newton-Raphson on the computed forward kinematics made the most sense.
            <br><br>
            For serial communications, I once again, used 
            <br><br>
            I containerized it in Docker since I was running ROS and was using OpenSUSE at the time. This required a lot of workaround since ROS in Docker was specifically sending command through UART to the Arduino for motor control. To get around this, I forward my USB device on my system to the Docker container.
            Using Docker had the additional benefit of making it easier to share the code.
            <br><br>
            The arm supports both Cartesian control (specifying x, y, z positions) and orientation control 
            (yaw, pitch, roll), enabling pick and place actions like with the electromagnet.
          `,
          images: [],
          videos: [
            { type: 'local', url: '/portfolio-site/projects/PXL_20240502_185846968.TS.mp4', caption: 'Joint test' },
            { type: 'local', url: '/portfolio-site/projects/IMG_0935.mov', caption: 'Electromagnet test' }
          ]
        },
        {
          id: 3,
          title: 'Codename FF (Kiwi Drive Robot)',
          date: 'Mar 2024 - Dec 2024',
          status: 'past',
          description: 'Low-cost omnidirectional robot with custom omniwheels and motion planning.',
          features: [
            'Designed, 3D-printed, and assembled low-cost omniwheels using paper-clip axles to build a Kiwi-drive mobile robot',
            'Implemented COBS-framed serial communication between Arduino and Raspberry Pi for robust packetized control',
            'Developed motion planning and velocity control for omnidirectional drivetrain'
          ],
          tags: [],
          additionalDetails: `
            I wanted to learn more about CAD, 3D Printing, and manufacturing while working on a robot. And thus, Codename FF was born.
            
            The goal of this project was to build an omnidirectional robot with a camera so it could be a while keeping it as cheap as possible. Traditional
            omniwheels are expensive, so I designed custom wheels that used paper clips as roller axles.
            <br><br>
            The main issue I ran into was with the traction of the rollers. Because it was 3D printed, it often slid on most surfaces and was unable to move. To remedy this, I used a combination adhesive and sand to coat each roller and this
            <br><br>
            The Kiwi drive configuration (three wheels at 120° angles) was the simplest holonomic drive for the job. 
            The motion planning algorithm converts desired robot velocities (forward, strafe, rotation)
            into individual wheel velocities using inverse kinematics specific to the Kiwi geometry.
            <br><br>
            COBS encoding was used for serial communication to ensure reliable packet transmission between
            the Raspberry Pi (high-level control) and Arduino (motor control), preventing data corruption
            and packet loss.
            <br><br>
            Results-wise, this project was able to follow tele-operated movements and record videos with the camera. It was admittedly pretty simple software wise. However, it was a good introduction to CAD as well as laser-cutting and 3D Printing.
            <br><br>
            I think if I can revisit this project, there are a couple of things I would change or add:
            <ul>
              <li>I would rubber-coat the rollers as that is strictly better than my sand coatting of the rollers.</li>
              <li>The electronics are very messy in its final state. A breakout board would have been ideal for prototyping while being better for wiring.
              <li>I would add some kind of manipulator to the center of the robot to increase its capabilities to more than just surveillance.</li>
            </ul>
          `,
          images: [
            { url: '/portfolio-site/projects/wheel_proto_1.jpg', caption: 'First wheel in progress' },
            { url: '/portfolio-site/projects/prototype1assembled.jpg', caption: 'First wheel version' },
            { url: '/portfolio-site/projects/wheel_2.jpg', caption: 'Second version (better tolerancing)' },
            { url: '/portfolio-site/projects/basewelectronics.jpg', caption: 'Base of the robot' },
            { url: '/portfolio-site/projects/fully.jpg', caption: 'Fully wired drivetrain' },
            { url: '/portfolio-site/projects/withcamera.jpg', caption: 'Robot with the camera on it' },
          ],
          videos: []
        },
        {
          id: 4,
          title: 'FRC 299 Valkyrie Robotics - AprilTag Vision System',
          date: 'Nov 2021 - Aug 2023',
          status: 'past',
          description: 'Real-time vision system for FRC robot localization using multiple OpenMV cameras.',
          features: [
            'Led and trained 5-8 software members, shipping competition-ready C++ code through a structured robotics curriculum',
            'Implemented multi-camera AprilTag vision by encoding UART data with COBS on a Teensy and forwarding via UDP to RoboRIO (0.5% message drop rate)',
            'Developed robot localization using AprilTags with ≤10° alignment error and autonomous balancing via PID control on the IMU readings (50% success rate)'
          ],
          tags: [],
          additionalDetails: `
            Note, I'm writing this in 2025, two years after this happened. As such, I don't have as many images for this:
            <br><br>
            Context: FRC Charged Up was the year that added AprilTags to the field. Each AprilTag was numbered and corresponded to a specific position on the field. This was especially useful for autonomous mode for localization and for aligning the robot to help with scoring.
            Thus, most of my work was on our teams vision system.
            <br><br>
            I implemented this using OpenMV cameras. OpenMV cameras had settings for intrinsic calibration (to get rid of the fish-eye lens distortion) and resolution settings. I tested which combination of focal point and resolution led to the best combination of max distance and max range of angles an AprilTag could be at while still being recognized by trying out relevant combinations and seeing max distance way and orientation of the tag.
            <br><br>
            After calibrating the camera and selecting a resolution, I had to get that camera data to the RoboRIO, the main processing board of the robot.
            Here is the vision pipeline summarized:
            <ul>
              <li>Each camera sent its data to one Teensy via UART. The messages were made more reliable by being COBS encoded, which allowed each message to unambiguously end with a 0.</li>
              <li>The Teensy would aggregate this data and send all of the camera data to the RoboRIO. This was done via a UDP socket and direct ethernet connection.</li>
            </ul>   
            <br><br>
            The final step was robot localization. My goal was for the robot to get its position as an x,y position if you look at the field from a top down view.
            <br><br>
            The main issue was estimating position when the robot didn't see an AprilTag.
            <br><br>
            In hindsight, I would've used a Kalman Filter for robot position estimation, but I did not implement this because I didn't know what a Kalman Filter was back then and I had some time constraints before regionals.
            I instead focused on writing a simple autonomous routine for the balancing part of that FRC game and code to align the robot to the AprilTag for easier scoring.
            <br><br>
            Here are images and videos I could find (not many):
          `,
          images: [
            { url: '/portfolio-site/projects/test_rig.jpg', caption: 'Only image I could find of the test rig. You can see the red on that cardboard is the OpenMV camera.' },
          ],
          videos: [
            { type: 'local', url: '/portfolio-site/projects/auton_failed.mp4', caption: 'This is an test for tuning the PID controller. As you can see, it did not converge.'}
          ]
        }
      ]
    }
  },
  computed: {
    filteredProjects() {
      return this.projects.filter(p => p.status === this.activeTab)
    }
  },
  methods: {
    openModal(project) {
      this.selectedProject = project
      document.body.style.overflow = 'hidden'
    },
    closeModal() {
      this.selectedProject = null
      document.body.style.overflow = 'auto'
    },
    getYoutubeEmbed(url) {
      // Convert YouTube URL to embed format
      const videoId = url.split('v=')[1]?.split('&')[0] || url.split('/').pop()
      return `https://www.youtube.com/embed/${videoId}`
    }
  },
  beforeUnmount() {
    document.body.style.overflow = 'auto'
  }
}
</script>

<style scoped>
.projects {
  padding: 4rem 0;
}

h1 {
  font-size: 3rem;
  margin-bottom: 0.5rem;
}

.subtitle {
  font-size: 1.25rem;
  color: #6b7280;
  margin-bottom: 2rem;
}

/* Tabs */
.tabs {
  display: flex;
  gap: 1rem;
  margin-bottom: 3rem;
  border-bottom: 2px solid var(--border-color);
}

.tab {
  padding: 1rem 2rem;
  background: none;
  border: none;
  font-size: 1.125rem;
  font-weight: 600;
  color: #6b7280;
  cursor: pointer;
  transition: all 0.3s ease;
  border-bottom: 3px solid transparent;
  margin-bottom: -2px;
}

.tab:hover {
  color: var(--primary-color);
}

.tab.active {
  color: var(--primary-color);
  border-bottom-color: var(--primary-color);
}

.project-grid {
  display: grid;
  gap: 2rem;
}

.project-card {
  background: var(--card-bg);
  padding: 2rem;
  border-radius: 0.75rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
  position: relative;
}

.project-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
}

.project-card:hover .click-hint {
  opacity: 1;
}

.click-hint {
  position: absolute;
  bottom: 1rem;
  right: 1rem;
  color: var(--primary-color);
  font-size: 0.875rem;
  font-weight: 600;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.project-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1rem;
  gap: 1rem;
}

.project-header h3 {
  font-size: 1.75rem;
  margin: 0;
}

.date {
  color: #6b7280;
  font-size: 0.875rem;
  white-space: nowrap;
}

.description {
  color: #4b5563;
  margin-bottom: 1.5rem;
  font-size: 1.0625rem;
}

.features {
  list-style: none;
  margin-bottom: 1.5rem;
}

.features li {
  padding-left: 1.5rem;
  position: relative;
  margin-bottom: 0.75rem;
  color: #374151;
}

.features li::before {
  content: '→';
  position: absolute;
  left: 0;
  color: var(--primary-color);
  font-weight: bold;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tag {
  background: #e0e7ff;
  color: #4338ca;
  padding: 0.25rem 0.75rem;
  border-radius: 9999px;
  font-size: 0.875rem;
  font-weight: 500;
}

/* Modal Styles */
.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.3s ease;
}

.modal-fade-enter-from,
.modal-fade-leave-to {
  opacity: 0;
}

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.75);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 2rem;
  overflow-y: auto;
}

.modal-content {
  background: var(--card-bg);
  border-radius: 1rem;
  max-width: 900px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
  padding: 3rem;
  animation: slideUp 0.3s ease;
}

@keyframes slideUp {
  from {
    transform: translateY(50px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.close-btn {
  position: absolute;
  top: 1.5rem;
  right: 1.5rem;
  background: none;
  border: none;
  font-size: 2.5rem;
  color: #6b7280;
  cursor: pointer;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: all 0.3s ease;
  line-height: 1;
}

.close-btn:hover {
  background: var(--bg-color);
  color: var(--text-color);
  transform: rotate(90deg);
}

.modal-header {
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 2px solid var(--border-color);
}

.modal-header h2 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
}

.modal-date {
  color: #6b7280;
  font-size: 1rem;
}

.modal-body {
  line-height: 1.8;
}

.modal-body h3 {
  font-size: 1.75rem;
  margin-top: 2rem;
  margin-bottom: 1rem;
  color: var(--text-color);
}

.modal-description {
  font-size: 1.125rem;
  color: #4b5563;
  margin-bottom: 2rem;
}

.modal-features {
  list-style: none;
  margin-bottom: 2rem;
}

.modal-features li {
  padding-left: 2rem;
  position: relative;
  margin-bottom: 1rem;
  color: #374151;
  font-size: 1.0625rem;
}

.modal-features li::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: var(--primary-color);
  font-weight: bold;
  font-size: 1.25rem;
}

.media-section {
  margin-top: 2.5rem;
}

.image-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-top: 1.5rem;
}

.project-image {
  width: 100%;
  height: auto;
  border-radius: 0.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.image-caption,
.video-caption {
  text-align: center;
  color: #6b7280;
  font-size: 0.875rem;
  margin-top: 0.5rem;
  font-style: italic;
}

.video-grid {
  display: grid;
  gap: 2rem;
  margin-top: 1.5rem;
}

.video-container {
  width: 100%;
}

.video-container iframe,
.project-video {
  width: 100%;
  aspect-ratio: 16/9;
  border-radius: 0.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
  h1 {
    font-size: 2rem;
  }
  
  .tabs {
    flex-direction: column;
    gap: 0;
  }
  
  .tab {
    border-bottom: 1px solid var(--border-color);
    border-left: 3px solid transparent;
    text-align: left;
    margin-bottom: 0;
  }
  
  .tab.active {
    border-bottom-color: var(--border-color);
    border-left-color: var(--primary-color);
  }
  
  .project-header {
    flex-direction: column;
  }
  
  .modal-content {
    padding: 2rem;
    max-height: 95vh;
  }
  
  .modal-header h2 {
    font-size: 1.75rem;
  }
  
  .close-btn {
    top: 1rem;
    right: 1rem;
  }
  
  .image-grid {
    grid-template-columns: 1fr;
  }
}
</style>
