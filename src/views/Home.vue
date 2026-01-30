<template>
  <div class="home">
    <section class="hero">
      <div class="container">
        <div class="hero-content">
          <div class="profile-section">
            <div class="profile-image-container">
              <!-- Replace /images/profile.jpg with your actual photo -->
              <img 
                src="/images/profile.jpg" 
                alt="Prabhvir Singh Babra" 
                class="profile-image"
                @error="handleImageError"
              />
              <div class="profile-border"></div>
            </div>
            <div class="profile-text">
              <h1 class="hero-title">Prabhvir Singh Babra</h1>
              <p class="hero-subtitle">Computer Engineering & Mathematics @ UCLA</p>
              
              <!-- Intro Blurb - CUSTOMIZE THIS -->
              <div class="intro-blurb">
                <p>
I am a robotics-focused engineer with a strong grounding in mathematics, motivated by the challenge of turning abstract models into systems that move, sense, and act in the real world. I first became interested in robotics through FIRST Robotics Competition, where software stopped being purely conceptual and became something tangible—code that directly shaped physical behavior. Since then, my interests have centered on controls and localization, where mathematical structure and physical intuition meet, and where correctness matters as much as performance. I am particularly drawn to problems that reward rigor: constructing proofs, debugging complex systems, and integrating theory with real robotic pipelines.
                </p>
                <p>
My current research interests lie at the intersection of learning and model-based methods, with a focus on imitation learning informed by structured control and mathematical modeling. While I am increasingly interested in learning-based approaches for the flexibility they offer, I am skeptical of purely black-box solutions and believe that machine learning is most effective when paired with reliable control frameworks and principled models. This philosophy is reflected in my decision to pursue mathematics as a second major, with the goal of becoming the “math-oriented” contributor on robotics teams—someone who improves system reliability by modeling behavior carefully rather than relying on ad hoc solutions. Ultimately, I aim to work on robotics problems where mathematical clarity enables robust real-world performance.
                </p>
              </div>
              
              <div class="hero-links">
                <a href="https://github.com/Prababameister" target="_blank" class="btn btn-primary">
                  <svg width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                  </svg>
                  GitHub
                </a>
                <a href="https://linkedin.com/in/prabhvir-babra-aa8262254" target="_blank" class="btn btn-secondary">
                  <svg width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
                  </svg>
                  LinkedIn
                </a>
                <a href="mailto:prabab@ucla.edu" class="btn btn-secondary">
                  <svg width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M0 3v18h24v-18h-24zm6.623 7.929l-4.623 5.712v-9.458l4.623 3.746zm-4.141-5.929h19.035l-9.517 7.713-9.518-7.713zm5.694 7.188l3.824 3.099 3.83-3.104 5.612 6.817h-18.779l5.513-6.812zm9.208-1.264l4.616-3.741v9.348l-4.616-5.607z"/>
                  </svg>
                  Email
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'Home',
  methods: {
    handleImageError(e) {
      // Fallback to placeholder if image doesn't exist
      e.target.src = 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="300" height="300"%3E%3Crect fill="%23f5ede4" width="300" height="300"/%3E%3Ctext fill="%23c73838" font-family="Noto Serif JP" font-size="24" x="50%25" y="50%25" text-anchor="middle" dy=".3em"%3EAdd Your Photo%3C/text%3E%3C/svg%3E'
    }
  }
}
</script>

<style scoped>
.hero {
  min-height: calc(100vh - var(--navbar-height, 80px));
  display: flex;
  align-items: center;

  padding: 4rem 0;
  background: linear-gradient(
    135deg,
    var(--card-bg) 0%,
    #fff9f0 50%,
    var(--bg-color) 100%
  );

  position: relative;
  overflow: hidden;
}

.hero::before {
  content: '';
  position: absolute;
  top: -50%;
  right: -10%;
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(199, 56, 56, 0.08) 0%, transparent 70%);
  border-radius: 50%;
}

.hero-content {
  position: relative;
  z-index: 1;
}

.profile-section {
  display: grid;
  grid-template-columns: 300px 1fr;
  gap: 3rem;
  align-items: start;
}

.profile-image-container {
  position: relative;
  width: 300px;
  height: 300px;
}

.profile-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 8px;
  border: 4px solid var(--card-bg);
  box-shadow: 
    0 8px 24px rgba(199, 56, 56, 0.2),
    inset 0 0 0 1px rgba(212, 196, 176, 0.3);
  position: relative;
  z-index: 2;
}

.profile-border {
  position: absolute;
  top: 12px;
  left: 12px;
  width: 100%;
  height: 100%;
  border: 3px solid var(--primary-color);
  border-radius: 8px;
  z-index: 1;
}

.profile-text {
  padding-top: 1rem;
}

.hero-title {
  font-size: 3rem;
  font-weight: 900;
  margin-bottom: 0.5rem;
  color: var(--text-color);
  font-family: 'Noto Serif JP', serif;
}

.hero-subtitle {
  font-size: 1.375rem;
  margin-bottom: 2rem;
  color: var(--secondary-color);
  font-weight: 500;
  font-family: 'Noto Serif JP', serif;
}

.intro-blurb {
  background: rgba(255, 255, 255, 0.6);
  border-left: 4px solid var(--primary-color);
  padding: 1.5rem;
  margin-bottom: 2rem;
  border-radius: 4px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.intro-blurb p {
  font-size: 1.0625rem;
  line-height: 1.8;
  margin-bottom: 1rem;
  color: var(--text-color);
}

.intro-blurb p:last-child {
  margin-bottom: 0;
}

.hero-links {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  font-weight: 600;
  font-family: 'Noto Sans JP', sans-serif;
  transition: all 0.3s ease;
  border: 2px solid;
}

.btn-primary {
  background: var(--primary-color);
  color: white;
  border-color: var(--primary-color);
}

.btn-primary:hover {
  background: var(--accent-red);
  border-color: var(--accent-red);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(199, 56, 56, 0.3);
}

.btn-secondary {
  background: var(--card-bg);
  color: var(--secondary-color);
  border-color: var(--secondary-color);
}

.btn-secondary:hover {
  background: var(--secondary-color);
  color: white;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(44, 107, 111, 0.3);
}

.highlights {
  padding: 4rem 0 6rem;
}

.section-title {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 3rem;
  font-family: 'Noto Serif JP', serif;
  font-weight: 700;
  color: var(--text-color);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
}

.title-decoration {
  color: var(--primary-color);
  font-size: 1.5rem;
}

.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.card {
  background: var(--card-bg);
  padding: 2.5rem 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 2px solid var(--border-color);
  position: relative;
  overflow: hidden;
}

.card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 24px rgba(199, 56, 56, 0.15);
  border-color: var(--primary-color);
}

.card-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.card h3 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  font-family: 'Noto Serif JP', serif;
  color: var(--text-color);
}

.card p {
  line-height: 1.7;
  color: #5a4e44;
}

@media (max-width: 968px) {
  .profile-section {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .profile-image-container {
    margin: 0 auto;
  }
  
  .hero-title {
    font-size: 2.25rem;
  }
  
  .hero-subtitle {
    font-size: 1.125rem;
  }
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2rem;
  }
  
  .cards {
    grid-template-columns: 1fr;
  }
  
  .profile-image-container {
    width: 250px;
    height: 250px;
  }
}
</style>
