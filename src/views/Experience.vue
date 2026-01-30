<template>
  <div class="experience">
    <div class="container">
      <h1>Experience</h1>
      <p class="subtitle">Research, leadership, and hands-on robotics work</p>
      
      <div class="timeline">
        <div class="experience-card" v-for="exp in experiences" :key="exp.id">
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
    </div>
  </div>
</template>

<script>
export default {
  name: 'Experience',
  data() {
    return {
      experiences: [
        {
          id: 1,
          title: 'Undergraduate Research Assistant',
          organization: 'Robotics and Mechanisms Laboratory (RoMeLa)',
          date: 'June 2025 - Present',
          location: 'Los Angeles, CA',
          achievements: [
            'Improved expert model prediction accuracy in an AMP locomotion framework by 15% by identifying incorrect contact forces on end-effectors and modifying URDF collision geometry and AMP observation frames in Isaac Gym',
            'Trained a HiTorque humanoid robot to walk robustly while withstanding 0.5 m/s external pushes through controller and reward fine-tuning',
            'Increased data collection throughput by 50-70% by developing a batch experiment runner enabling parallelized overnight training across parameter sweeps'
          ]
        }
      ]
    }
  }
}
</script>

<style scoped>
.experience {
  padding: 4rem 0;
}

h1 {
  font-size: 3rem;
  margin-bottom: 0.5rem;
}

.subtitle {
  font-size: 1.25rem;
  color: #6b7280;
  margin-bottom: 3rem;
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
  width: 2px;
  background: var(--border-color);
}

.experience-card {
  position: relative;
  background: var(--card-bg);
  padding: 2rem;
  padding-left: 5rem;
  border-radius: 0.75rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.experience-card::before {
  content: '';
  position: absolute;
  left: 1.5rem;
  top: 2.5rem;
  width: 1rem;
  height: 1rem;
  border-radius: 50%;
  background: var(--primary-color);
  border: 3px solid var(--card-bg);
  box-shadow: 0 0 0 3px var(--bg-color);
}

.experience-card:hover {
  transform: translateX(10px);
  box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
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
  margin: 0 0 0.25rem 0;
  color: var(--text-color);
}

.card-header h4 {
  font-size: 1.125rem;
  margin: 0;
  color: var(--primary-color);
  font-weight: 600;
}

.meta {
  text-align: right;
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.date, .location {
  color: #6b7280;
  font-size: 0.875rem;
  white-space: nowrap;
}

.achievements {
  list-style: none;
}

.achievements li {
  padding-left: 1.5rem;
  position: relative;
  margin-bottom: 0.75rem;
  color: #374151;
  line-height: 1.6;
}

.achievements li::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: var(--primary-color);
  font-weight: bold;
}

@media (max-width: 768px) {
  h1 {
    font-size: 2rem;
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
}
</style>
