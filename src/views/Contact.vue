<template>
  <div class="contact">
    <div class="container">
      <div class="page-header">
        <h1>
          <span class="title-decoration">◆</span>
          Get in Touch
          <span class="title-decoration">◆</span>
        </h1>
      </div>

      <div class="wave-divider"></div>
      
      <div class="contact-grid">
        <div class="contact-card">
          <div class="icon">
            <svg width="48" height="48" fill="currentColor" viewBox="0 0 24 24">
              <path d="M0 3v18h24v-18h-24zm6.623 7.929l-4.623 5.712v-9.458l4.623 3.746zm-4.141-5.929h19.035l-9.517 7.713-9.518-7.713zm5.694 7.188l3.824 3.099 3.83-3.104 5.612 6.817h-18.779l5.513-6.812zm9.208-1.264l4.616-3.741v9.348l-4.616-5.607z"/>
            </svg>
          </div>
          <h3>Email</h3>
          <a href="mailto:prabab@ucla.edu">prabab@ucla.edu</a>
        </div>
        
        <div class="contact-card">
          <div class="icon">
            <svg width="48" height="48" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
            </svg>
          </div>
          <h3>GitHub</h3>
          <a href="https://github.com/Prababameister" target="_blank">@Prababameister</a>
        </div>
        
        <div class="contact-card">
          <div class="icon">
            <svg width="48" height="48" fill="currentColor" viewBox="0 0 24 24">
              <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
            </svg>
          </div>
          <h3>LinkedIn</h3>
          <a href="https://linkedin.com/in/prabhvir-babra-aa8262254" target="_blank">Prabhvir Babra</a>
        </div>
        
      </div>
      
      <div class="wave-divider"></div>
      
      <!-- Resume Download Section -->
      <div class="resume-section">
        <h2 class="section-title">
          <span class="section-icon">📄</span>
          Resume
        </h2>
        <div class="resume-card">
          <div class="resume-content">
            <div class="resume-icon">
              <svg width="64" height="64" fill="currentColor" viewBox="0 0 24 24">
                <path d="M14,2H6A2,2 0 0,0 4,4V20A2,2 0 0,0 6,22H18A2,2 0 0,0 20,20V8L14,2M18,20H6V4H13V9H18V20Z" />
              </svg>
            </div>
            <div class="resume-text">
              <h3>Download My Resume</h3>
              <!-- Replace /resume/prabhvir-babra-resume.pdf with your actual resume file -->
              <a href="/resume/prabhvir-babra-resume.pdf" download class="download-btn">
                <svg width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M5,20H19V18H5M19,9H15V3H9V9H5L12,16L19,9Z" />
                </svg>
                Download PDF
              </a>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
</template>

<script>
export default {
  name: 'Contact'
}
</script>

<style scoped>
.contact {
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
  max-width: 700px;
  margin: 0 auto;
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

.contact-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-bottom: 3rem;
}

.contact-card {
  background: var(--card-bg);
  padding: 2.5rem 2rem;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 2px solid var(--border-color);
  position: relative;
  overflow: hidden;
}

.contact-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
}

.contact-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 24px rgba(199, 56, 56, 0.15);
  border-color: var(--primary-color);
}

.icon {
  color: var(--primary-color);
  margin-bottom: 1rem;
}

.contact-card h3 {
  font-size: 1.375rem;
  margin-bottom: 0.75rem;
  font-family: 'Noto Serif JP', serif;
}

.contact-card a {
  font-size: 0.9375rem;
  word-break: break-all;
  color: var(--secondary-color);
  font-weight: 500;
}

/* Resume Section */
.resume-section {
  margin: 4rem 0;
}

.resume-card {
  background: linear-gradient(135deg, var(--card-bg) 0%, #fff9f0 100%);
  border-radius: 8px;
  border: 3px solid var(--border-color);
  box-shadow: 0 8px 24px rgba(199, 56, 56, 0.15);
  overflow: hidden;
}

.resume-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 6px;
  background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
}

.resume-content {
  display: flex;
  align-items: center;
  gap: 2rem;
  padding: 3rem;
  position: relative;
}

.resume-icon {
  color: var(--primary-color);
  flex-shrink: 0;
}

.resume-text h3 {
  font-size: 1.875rem;
  margin-bottom: 0.75rem;
  font-family: 'Noto Serif JP', serif;
  color: var(--text-color);
}

.resume-text p {
  color: #5a4e44;
  margin-bottom: 1.5rem;
  line-height: 1.7;
}

.download-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem 2rem;
  background: var(--primary-color);
  color: white;
  border-radius: 4px;
  font-weight: 700;
  font-family: 'Noto Sans JP', sans-serif;
  font-size: 1.0625rem;
  transition: all 0.3s ease;
  border: 2px solid var(--primary-color);
  box-shadow: 0 4px 12px rgba(199, 56, 56, 0.3);
}

.download-btn:hover {
  background: var(--accent-red);
  border-color: var(--accent-red);
  transform: translateY(-3px);
  box-shadow: 0 8px 20px rgba(199, 56, 56, 0.4);
}

.file-note {
  margin-top: 1rem;
  font-size: 0.875rem;
  color: #8a7a6f;
  font-style: italic;
}

.file-note code {
  background: rgba(199, 56, 56, 0.1);
  padding: 0.125rem 0.5rem;
  border-radius: 3px;
  font-family: 'Courier New', monospace;
  color: var(--primary-color);
}

/* About Section */
.additional-info {
  background: var(--card-bg);
  padding: 3rem;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  border: 2px solid var(--border-color);
}

.about-content p {
  color: #5a4e44;
  line-height: 1.8;
  margin-bottom: 1.5rem;
  font-size: 1.0625rem;
}

.about-content h3 {
  font-size: 1.75rem;
  margin-top: 2.5rem;
  margin-bottom: 1.5rem;
  font-family: 'Noto Serif JP', serif;
  color: var(--text-color);
}

.skills {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.skill-category {
  padding: 1.25rem;
  background: linear-gradient(135deg, rgba(199, 56, 56, 0.05), rgba(44, 107, 111, 0.05));
  border-radius: 4px;
  border-left: 4px solid var(--primary-color);
  color: #5a4e44;
  font-size: 1.0625rem;
}

.skill-category strong {
  color: var(--primary-color);
  margin-right: 0.75rem;
  font-family: 'Noto Serif JP', serif;
}

@media (max-width: 768px) {
  .page-header h1 {
    font-size: 2.5rem;
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .contact-grid {
    grid-template-columns: 1fr;
  }
  
  .resume-content {
    flex-direction: column;
    text-align: center;
    padding: 2rem;
  }
  
  .additional-info {
    padding: 2rem;
  }
}
</style>
