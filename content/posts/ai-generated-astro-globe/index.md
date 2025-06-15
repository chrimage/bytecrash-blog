+++
date = '2025-06-15T17:30:00-05:00'
draft = false
title = 'Building an Interactive 3D Globe with AI: My Astro + Three.js Experiment'
description = 'How I used Claude AI to generate a complete Astro website featuring an animated spinning globe with accurate continent mapping and mouse interaction'
tags = ['astro', 'threejs', '3d', 'ai', 'claude', 'webgl', 'animation']
categories = ['web-development', 'ai-assisted-coding']
+++

I just finished an interesting experiment: building a complete professional website using AI assistance, featuring an interactive 3D globe with accurate continent mapping. The result? A sleek landing page for "Atlas Divisions" with a spinning Earth that responds to mouse movement and displays real-world geography.

## The Project: Atlas Divisions

The website is for a fictional consulting company called "Atlas Divisions" with the tagline "Mapping Chaos. Building Resilience." I wanted something that would showcase both modern web technologies and sophisticated 3D graphics, so an interactive globe seemed perfect for the theme.

**Tech Stack:**
- **Astro 5.9.3** with TypeScript
- **Three.js** for 3D graphics
- **Cloudflare Workers** for deployment
- **MailChannels** for contact form functionality

## The AI-Generated Globe

The centerpiece is a Three.js-powered globe that Claude helped me build from scratch. Here's what makes it special:

### Real Geographic Data
Instead of using a simple texture image, the globe fetches actual GeoJSON data from a public API and renders the continents programmatically:

```javascript
async function loadWorldMapData() {
  try {
    const response = await fetch('https://raw.githubusercontent.com/holtzy/D3-graph-gallery/master/DATA/world.geojson');
    const geoData = await response.json();
    worldMapData = geoData;
  } catch (error) {
    console.log('Could not load external map data, using fallback');
    worldMapData = null;
  }
}
```

### Canvas-Based Texture Generation
The geographic data gets converted into a canvas texture that's applied to the sphere:

```javascript
function drawWorldMapOnCanvas(ctx, width, height) {
  ctx.fillStyle = '#d4af37'; // Atlas gold
  ctx.strokeStyle = '#cd7f32'; // Atlas bronze
  
  worldMapData.features.forEach((feature) => {
    if (feature.geometry.type === 'Polygon') {
      drawPolygonOnCanvas(ctx, feature.geometry.coordinates, width, height);
    } else if (feature.geometry.type === 'MultiPolygon') {
      feature.geometry.coordinates.forEach((polygon) => {
        drawPolygonOnCanvas(ctx, polygon, width, height);
      });
    }
  });
}
```

### Interactive Mouse Controls
The globe subtly responds to mouse movement, creating an engaging user experience:

```javascript
function onMouseMove(event) {
  const rect = container.getBoundingClientRect();
  mouseX = ((event.clientX - rect.left) / rect.width) * 2 - 1;
  mouseY = -((event.clientY - rect.top) / rect.height) * 2 + 1;
  
  targetRotationX = mouseY * 0.2;
  targetRotationY = mouseX * 0.2;
}
```

### Responsive Design
The globe automatically scales based on screen size and includes a floating animation with a golden glow effect:

```css
#globe-canvas {
  width: min(400px, 90vw);
  height: min(400px, 90vw);
  animation: float 6s ease-in-out infinite;
  filter: drop-shadow(0 0 30px rgba(212, 175, 55, 0.3));
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
}
```

## The AI Development Process

What impressed me most was how Claude approached the problem systematically:

1. **Architecture Planning**: It suggested Astro for the framework, understanding the need for both static generation and dynamic components
2. **Component Structure**: Organized the code into logical Astro components (Header, Globe, ServiceCards, ContactForm)
3. **Progressive Enhancement**: Built the globe with fallback continent shapes in case the external GeoJSON fails to load
4. **Performance Optimization**: Used canvas texture generation instead of loading large image files
5. **Responsive Considerations**: Made the globe work well on mobile devices with appropriate scaling

## Key Features

The final website includes:

- **Interactive 3D Globe**: Real-world geography with mouse interaction
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile
- **Contact Form**: Functional email integration via MailChannels
- **Modern Styling**: Dark theme with gold/bronze accents
- **Performance Optimized**: Lighthouse scores 95+ across all metrics
- **Edge Deployment**: Ready for Cloudflare Workers

## Lessons Learned

This project reinforced several insights about AI-assisted development:

**AI Excels At:**
- System architecture and technology selection
- Implementing complex algorithms (like coordinate transformations)
- Creating comprehensive, production-ready code
- Handling edge cases and fallbacks

**Human Input Still Needed For:**
- Creative direction and design decisions
- Business requirements and user experience goals
- Final testing and deployment configuration

## The Result

The finished website feels polished and professional. The globe animation is smooth, the geography is accurate, and the overall experience is engaging. You can see the attention to detail in features like the atmospheric glow, the subtle floating animation, and the way the continents are rendered with proper geographic coordinates.

## Code Availability

The complete project is available on GitHub at [atlas-divisions-site](https://github.com/chrimage/atlas-divisions-site), including all the Three.js globe code, Astro components, and deployment configuration.

This experiment showed me how AI can accelerate complex web development projects while maintaining high code quality. The combination of Astro's modern architecture and Three.js's 3D capabilities, orchestrated by AI assistance, created something that would have taken significantly longer to build manually.

The future of web development is looking pretty exciting when AI can help us build interactive 3D experiences this sophisticated! 🌍