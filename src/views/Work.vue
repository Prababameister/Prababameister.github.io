<template>
  <div class="work">
    <div class="container">
      <div class="page-header">
        <h1>
          <span class="title-decoration">◆</span>
          My Work
          <span class="title-decoration">◆</span>
        </h1>
        <p class="subtitle">Research, projects, and professional experience</p>
      </div>

      <div class="wave-divider"></div>
      
      <!-- Tab Navigation -->
      <div class="tabs">
        <button 
          :class="['tab', { active: activeTab === 'present' }]"
          @click="activeTab = 'present'"
        >
          Current Work
        </button>
        <button 
          :class="['tab', { active: activeTab === 'past' }]"
          @click="activeTab = 'past'"
        >
          Past Work
        </button>
      </div>
      
      <!-- Content for each tab -->
      <div class="tab-content">
        <!-- Experience Section -->
        <section class="experience-section">
          <h2 class="section-title">
            <span class="section-icon">💼</span>
            Experience
          </h2>
          <div class="timeline">
            <div 
              class="experience-card" 
              v-for="exp in filteredExperiences" 
              :key="exp.id"
            >
              <div class="card-header">
                <div>
                  <h3>{{ exp.title }}</h3>
                  <h4>{{ exp.organization }}</h4>
                </div>
                <div class="meta">
                  <span class="date">{{ exp.date }}</span>
                  <span class="location">{{ exp.location }}</span>
                </div>
              </div>
              <ul class="achievements">
                <li v-for="(achievement, idx) in exp.achievements" :key="idx">{{ achievement }}</li>
              </ul>
            </div>
          </div>
        </section>

        <div class="wave-divider"></div>

        <!-- Projects Section -->
        <section class="projects-section">
          <h2 class="section-title">
            <span class="section-icon">🔧</span>
            Projects
          </h2>
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
                <li v-for="(feature, idx) in project.features.slice(0, 2)" :key="idx">{{ feature }}</li>
              </ul>
              <div class="tags">
                <span class="tag" v-for="tag in project.tags" :key="tag">{{ tag }}</span>
              </div>
              <div class="click-hint">View details →</div>
            </div>
          </div>
        </section>
      </div>
    </div>
    
    <!-- Project Modal -->
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
            
            <div v-if="selectedProject.additionalDetails">
              <h3>Details</h3>
              <p v-html="selectedProject.additionalDetails"></p>
            </div>
            
            <div v-if="selectedProject.images && selectedProject.images.length" class="media-section">
              <h3>Images</h3>
              <div class="image-grid">
                <div v-for="(image, idx) in selectedProject.images" :key="idx" class="image-item">
                  <img :src="image.url" :alt="image.caption" class="project-image" />
                  <p class="image-caption">{{ image.caption }}</p>
                </div>
              </div>
            </div>
            
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
  name: 'Work',
  data() {
    return {
      activeTab: 'present',
      selectedProject: null,
      experiences: [
        {
          id: 1,
          title: 'Undergraduate Research Assistant',
          organization: 'Robotics and Mechanisms Laboratory (RoMeLa)',
          date: 'Jun 2025 - Present',
          location: 'Los Angeles, CA',
          status: 'present',
          achievements: [
            'Set up environment and trained HiTorque Hi humanoid robot to walk while withstanding 0.5 m/s pushes',
            'Fixed critical issues in AMP framework that improved model expert prediction by 20%',
            'Improved data-collection throughput by 50-70% by creating batch runner for experiments with varied parameters'
          ]
        },
        {
          id: 2,
          title: 'Project Lead',
          organization: '3D4E Robotics Track',
          date: 'Sep 2025 - Present',
          location: 'Los Angeles, CA',
          status: 'present',
          achievements: [
            'Led 8-person robotics team coordinating mechanical, controls, and simulation subgroups',
            'Delivered two full iterations of leg and hip joint prototypes',
            'Created and implemented motion planning for each leg using IK and cubic splines',
            'Improved code portability across operating systems by setting up Docker Compose with project repository'
          ]
        },
        {
          id: 3,
          title: 'Software Lead',
          organization: 'FRC 299 Valkyrie Robotics',
          date: 'Nov 2021 - Aug 2023',
          location: 'Los Angeles, CA',
          status: 'past',
          achievements: [
            'Led and trained 5-8 new software members through hands-on C++ and robotics curriculum',
            'Designed custom real-time AprilTag vision system using OpenMV cameras (20 FPS) with multi-camera networking',
            'Implemented AprilTag-based alignment and self-balancing routine for autonomous operation',
            'All trained members successfully shipped production code for robot superstructure'
          ]
        }
      ],
      projects: [
        {
          id: 1,
          title: 'BrandonW Robot Arm',
          date: 'Feb 2024 - Jun 2024',
          status: 'past',
          description: 'Complete software stack for a 6-DOF robot arm with IK solver, controllers, and hardware integration.',
          features: [
            'Built full C++/ROS software stack with numerical IK solver and custom controllers',
            'Created COBS-framed UART protocol to Arduino motor driver with ~99% message reliability',
            'Modeled arm in URDF, validated in Gazebo, and containerized with Docker',
            'Deployed to physical robot enabling Cartesian control and pick-and-place tasks'
          ],
          tags: ['C++', 'ROS', 'Inverse Kinematics', 'Docker', 'Gazebo', 'Arduino'],
          additionalDetails: `
            This project was a comprehensive exploration of robot arm control from simulation to hardware deployment.
            The inverse kinematics solver used a numerical Jacobian-based approach with joint limit handling.
            <br><br>
            The UART communication protocol was particularly challenging - we needed to ensure reliable communication
            between the ROS system and Arduino motor drivers. COBS (Consistent Overhead Byte Stuffing) encoding
            provided unambiguous packet framing, achieving 99%+ message delivery rate even under heavy load.
          `,
          images: [],
          videos: []
        },
        {
          id: 2,
          title: 'Codename FF (Kiwi Drive Robot)',
          date: 'Dec 2023 - Mar 2024',
          status: 'past',
          description: 'Low-cost omnidirectional robot with custom omniwheels and motion planning.',
          features: [
            'Designed and 3D printed cheap omniwheels using paper clips for axles',
            'Implemented COBS encoding for unambiguous serial packets between Arduino and Raspberry Pi',
            'Calculated and implemented motion planning for Kiwi drivetrain',
            'Assembled complete low-cost omnidirectional robot platform'
          ],
          tags: ['Python', 'Arduino', 'CAD', '3D Printing', 'Motion Planning', 'COBS'],
          additionalDetails: `
            The goal of this project was to build an omnidirectional robot on a tight budget. Traditional
            omniwheels are expensive, so I designed custom wheels that used paper clips as roller axles.
          `,
          images: [],
          videos: []
        },
        {
          id: 3,
          title: 'Custom AprilTag Vision System',
          date: 'Nov 2021 - Aug 2023',
          status: 'past',
          description: 'Real-time vision system for FRC robot localization using multiple OpenMV cameras.',
          features: [
            'Designed custom real-time AprilTag vision system with OpenMV cameras at 20 FPS',
            'Implemented camera calibration and multi-camera networking',
            'Used Teensy microcontroller to send data to RoboRIO over UDP',
            'Enabled tag detection at 1+ meter range for robot localization'
          ],
          tags: ['Computer Vision', 'OpenMV', 'AprilTag', 'C++', 'UDP', 'Teensy'],
          additionalDetails: `
            This vision system was crucial for autonomous navigation during FRC competitions. AprilTags
            provide precise pose estimation essential for aligning with game pieces.
          `,
          images: [],
          videos: []
        }
      ]
    }
  },
  computed: {
    filteredExperiences() {
      return this.experiences.filter(e => e.status === this.activeTab)
    },
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
.work {
  padding: 4rem 0;
}

.page-header {
  text-align: center;
  margin-bottom: 2rem;
}

.page-header h1 {
  font-size: 3.5rem;
  font-family: 'Noto Serif JP', serif;
  font-weight: 900;
  margin-bottom: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1.5rem;
}

.title-decoration {
  color: var(--primary-color);
  font-size: 2rem;
}

.subtitle {
  font-size: 1.25rem;
  color: var(--secondary-color);
  font-family: 'Noto Serif JP', serif;
}

/* Tabs */
.tabs {
  display: flex;
  gap: 1rem;
  margin: 3rem 0;
  justify-content: center;
}

.tab {
  padding: 1rem 3rem;
  background: var(--card-bg);
  border: 2px solid var(--border-color);
  font-size: 1.125rem;
  font-weight: 600;
  font-family: 'Noto Serif JP', serif;
  color: var(--text-color);
  cursor: pointer;
  transition: all 0.3s ease;
  border-radius: 4px;
  position: relative;
}

.tab::before {
  content: '';
  position: absolute;
  top: -2px;
  left: -2px;
  right: -2px;
  bottom: -2px;
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  border-radius: 4px;
  opacity: 0;
  transition: opacity 0.3s ease;
  z-index: -1;
}

.tab:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(199, 56, 56, 0.2);
}

.tab.active {
  background: var(--primary-color);
  color: white;
  border-color: var(--primary-color);
}

.section-title {
  font-size: 2.25rem;
  font-family: 'Noto Serif JP', serif;
  margin-bottom: 2rem;
  display: flex;
  align-items: center;
  gap: 0.75rem;
  color: var(--text-color);
}

.section-icon {
  font-size: 2rem;
}

/* Experience Styles */
.experience-section {
  margin-bottom: 4rem;
}

.timeline {
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 2rem;
  top: 0;
  bottom: 0;
  width: 3px;
  background: linear-gradient(180deg, var(--primary-color), var(--secondary-color));
}

.experience-card {
  position: relative;
  background: var(--card-bg);
  padding: 2rem;
  padding-left: 5rem;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 2px solid var(--border-color);
}

.experience-card::before {
  content: '';
  position: absolute;
  left: 1.375rem;
  top: 2.5rem;
  width: 1.25rem;
  height: 1.25rem;
  border-radius: 50%;
  background: var(--primary-color);
  border: 4px solid var(--card-bg);
  box-shadow: 0 0 0 3px var(--bg-color);
  z-index: 2;
}

.experience-card:hover {
  transform: translateX(10px);
  box-shadow: 0 8px 20px rgba(199, 56, 56, 0.15);
  border-color: var(--primary-color);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1.5rem;
  gap: 2rem;
}

.card-header h3 {
  font-size: 1.5rem;
  margin: 0 0 0.5rem 0;
  font-family: 'Noto Serif JP', serif;
  color: var(--text-color);
}

.card-header h4 {
  font-size: 1.125rem;
  margin: 0;
  color: var(--secondary-color);
  font-weight: 600;
  font-family: 'Noto Sans JP', sans-serif;
}

.meta {
  text-align: right;
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.date, .location {
  color: #6b5d52;
  font-size: 0.875rem;
  white-space: nowrap;
}

.achievements {
  list-style: none;
}

.achievements li {
  padding-left: 2rem;
  position: relative;
  margin-bottom: 0.75rem;
  color: #5a4e44;
  line-height: 1.7;
}

.achievements li::before {
  content: '◆';
  position: absolute;
  left: 0;
  color: var(--primary-color);
  font-size: 0.875rem;
}

/* Project Styles */
.projects-section {
  margin-bottom: 2rem;
}

.project-grid {
  display: grid;
  gap: 2rem;
}

.project-card {
  background: var(--card-bg);
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  cursor: pointer;
  position: relative;
  border: 2px solid var(--border-color);
}

.project-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
  border-radius: 8px 8px 0 0;
}

.project-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 24px rgba(199, 56, 56, 0.15);
  border-color: var(--primary-color);
}

.project-card:hover .click-hint {
  opacity: 1;
}

.click-hint {
  position: absolute;
  bottom: 1.5rem;
  right: 2rem;
  color: var(--primary-color);
  font-size: 0.875rem;
  font-weight: 700;
  font-family: 'Noto Sans JP', sans-serif;
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
  font-size: 1.625rem;
  margin: 0;
  font-family: 'Noto Serif JP', serif;
}

.description {
  color: #5a4e44;
  margin-bottom: 1.5rem;
  font-size: 1.0625rem;
  line-height: 1.7;
}

.features {
  list-style: none;
  margin-bottom: 1.5rem;
}

.features li {
  padding-left: 1.5rem;
  position: relative;
  margin-bottom: 0.75rem;
  color: #5a4e44;
}

.features li::before {
  content: '→';
  position: absolute;
  left: 0;
  color: var(--secondary-color);
  font-weight: bold;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tag {
  background: linear-gradient(135deg, rgba(199, 56, 56, 0.1), rgba(44, 107, 111, 0.1));
  color: var(--text-color);
  padding: 0.375rem 0.875rem;
  border-radius: 4px;
  font-size: 0.875rem;
  font-weight: 600;
  border: 1px solid var(--border-color);
  font-family: 'Noto Sans JP', sans-serif;
}

/* Modal styles - reusing from previous implementation */
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
  background: rgba(45, 36, 32, 0.85);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 2rem;
  overflow-y: auto;
}

.modal-content {
  background: var(--card-bg);
  border-radius: 8px;
  max-width: 900px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
  padding: 3rem;
  animation: slideUp 0.3s ease;
  border: 3px solid var(--border-color);
  box-shadow: 0 20px 60px rgba(199, 56, 56, 0.3);
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
  border: 2px solid var(--border-color);
  font-size: 2rem;
  color: var(--text-color);
  cursor: pointer;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: all 0.3s ease;
  line-height: 1;
  font-family: 'Noto Sans JP', sans-serif;
}

.close-btn:hover {
  background: var(--primary-color);
  color: white;
  border-color: var(--primary-color);
  transform: rotate(90deg);
}

.modal-header {
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 3px solid;
  border-image: linear-gradient(90deg, var(--primary-color), var(--secondary-color)) 1;
}

.modal-header h2 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
  font-family: 'Noto Serif JP', serif;
}

.modal-date {
  color: var(--secondary-color);
  font-size: 1rem;
  font-weight: 600;
}

.modal-body h3 {
  font-size: 1.75rem;
  margin-top: 2rem;
  margin-bottom: 1rem;
  font-family: 'Noto Serif JP', serif;
}

.modal-description {
  font-size: 1.125rem;
  margin-bottom: 2rem;
  line-height: 1.8;
}

.modal-features {
  list-style: none;
  margin-bottom: 2rem;
}

.modal-features li {
  padding-left: 2rem;
  position: relative;
  margin-bottom: 1rem;
  font-size: 1.0625rem;
  line-height: 1.7;
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

.image-item {
  text-align: center;
}

.project-image {
  width: 100%;
  height: auto;
  border-radius: 8px;
  border: 2px solid var(--border-color);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.image-caption,
.video-caption {
  text-align: center;
  color: #6b5d52;
  font-size: 0.875rem;
  margin-top: 0.75rem;
  font-style: italic;
}

.video-grid {
  display: grid;
  gap: 2rem;
  margin-top: 1.5rem;
}

.video-container iframe,
.project-video {
  width: 100%;
  aspect-ratio: 16/9;
  border-radius: 8px;
  border: 2px solid var(--border-color);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
  .page-header h1 {
    font-size: 2.5rem;
  }
  
  .tabs {
    flex-direction: column;
    gap: 0.75rem;
  }
  
  .tab {
    padding: 0.875rem 2rem;
  }
  
  .timeline::before {
    left: 0.5rem;
  }
  
  .experience-card {
    padding-left: 2.5rem;
  }
  
  .experience-card::before {
    left: 0;
  }
  
  .card-header {
    flex-direction: column;
    gap: 1rem;
  }
  
  .meta {
    text-align: left;
  }
  
  .modal-content {
    padding: 2rem;
  }
  
  .modal-header h2 {
    font-size: 1.875rem;
  }
  
  .image-grid {
    grid-template-columns: 1fr;
  }
}
</style>