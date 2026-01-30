<template>
  <div id="app">
    <header class="header">
      <div class="header-border-top"></div>
      <nav class="nav container">
        <router-link to="/" class="logo">
          <!-- Replace '/images/logo.png' with your own logo image -->
          <!-- If you don't have a logo yet, you can comment out the img tag -->
          <img src="/images/site-logo.svg" alt="Logo" class="logo-image" />
          <span class="logo-text">Prabhvir S. Babra</span>
        </router-link>
        <div class="nav-links">
          <router-link to="/">Home</router-link>
          <router-link to="/projects">Projects</router-link>
          <router-link to="/experience">Experience</router-link>
          <router-link to="/contact">Contact</router-link>
        </div>
      </nav>
      <div class="header-border-bottom"></div>
    </header>
    
    <main>
      <router-view />
    </main>
    
    <footer class="footer">
      <div class="container">
        <p>&copy; 2026 Prabhvir Singh Babra</p>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style scoped>
.header {
  background: linear-gradient(135deg, var(--card-bg) 0%, #fff9f0 100%);
  position: sticky;
  top: 0;
  z-index: 100;
  box-shadow: 0 4px 12px rgba(199, 56, 56, 0.1);
}

.header-border-top,
.header-border-bottom {
  height: 6px;
  background: linear-gradient(
    90deg,
    var(--primary-color) 0%,
    var(--secondary-color) 25%,
    var(--soft-green) 50%,
    var(--secondary-color) 75%,
    var(--primary-color) 100%
  );
}

.header-border-top {
  background: var(--primary-color);
}

.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.5rem 2rem;
}

.logo {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-family: 'Noto Serif JP', serif;
  color: var(--text-color);
  transition: all 0.3s ease;
}

.logo:hover {
  transform: translateY(-2px);
}

.logo-image {
  height: 2.5rem;
  width: auto;
  object-fit: contain;
}

.logo-text {
  font-size: 1.25rem;
  font-weight: 600;
  letter-spacing: 0.02em;
}

.nav-links {
  display: flex;
  gap: 0.5rem;
}

.nav-links a {
  font-family: 'Noto Serif JP', serif;
  font-weight: 600;
  font-size: 1.0625rem;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  transition: all 0.3s ease;
  border: 2px solid transparent;
  position: relative;
}

.nav-links a::after {
  content: '';
  position: absolute;
  bottom: 0.5rem;
  left: 50%;
  transform: translateX(-50%) scaleX(0);
  width: 60%;
  height: 2px;
  background: var(--primary-color);
  transition: transform 0.3s ease;
}

.nav-links a:hover {
  background: rgba(199, 56, 56, 0.05);
  border-color: var(--border-color);
}

.nav-links a:hover::after {
  transform: translateX(-50%) scaleX(1);
}

.nav-links a.router-link-active {
  color: var(--primary-color);
  background: rgba(199, 56, 56, 0.08);
  border-color: var(--primary-color);
}

.nav-links a.router-link-active::after {
  transform: translateX(-50%) scaleX(1);
}

main {
  min-height: calc(100vh - 180px);
}

.footer {
  background: linear-gradient(135deg, var(--card-bg) 0%, #fff9f0 100%);
  padding: 2rem 0;
  margin-top: 4rem;
  text-align: center;
  color: #6b5d52;
}

.footer p {
  font-family: 'Noto Serif JP', serif;
  font-size: 0.9375rem;
}

@media (max-width: 768px) {
  .nav {
    flex-direction: column;
    gap: 1rem;
    padding: 1rem;
  }
  
  .logo-text {
    font-size: 1rem;
  }
  
  .logo-image {
    height: 2rem;
  }
  
  .nav-links {
    width: 100%;
    justify-content: center;
    flex-wrap: wrap;
    gap: 0.5rem;
  }
  
  .nav-links a {
    padding: 0.5rem 1rem;
    font-size: 0.9375rem;
  }
}
</style>
