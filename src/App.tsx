import React from 'react';
import Hero from './components/Hero';
import MatchPreview from './components/MatchPreview';
import HowItWorks from './components/HowItWorks';
import DualPersona from './components/DualPersona';
import Testimonials from './components/Testimonials';
import CTA from './components/CTA';
import Footer from './components/Footer';

function App() {
  return (
    <main className="min-h-screen bg-ivory">
      <Hero />
      <MatchPreview />
      <HowItWorks />
      <DualPersona />
      <Testimonials />
      <CTA />
      <Footer />
    </main>
  );
}

export default App;