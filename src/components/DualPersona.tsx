import { motion } from 'framer-motion';
import { Users, Building2, CheckCircle } from 'lucide-react';

const creatorPoints = [
  "Discover aligned opportunities",
  "Upload your vibe + rates",
  "Accept offers with confidence"
];

const brandPoints = [
  "Find real community reps",
  "Swipe through curated talent",
  "Send thoughtful, trackable offers"
];

export default function DualPersona() {
  return (
    <section className="py-24 bg-porcelain overflow-hidden">
      <div className="container mx-auto px-4">
        <div className="flex flex-col lg:flex-row gap-12 lg:gap-8">
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="flex-1 p-8 bg-white rounded-2xl shadow-soft"
          >
            <Users className="w-12 h-12 text-obsidian mb-6" />
            <h3 className="text-2xl font-semibold mb-6 text-obsidian">For Creators</h3>
            <ul className="space-y-4">
              {creatorPoints.map((point, index) => (
                <li key={index} className="flex items-center gap-3">
                  <CheckCircle className="w-5 h-5 text-sage" />
                  <span className="text-graphite">{point}</span>
                </li>
              ))}
            </ul>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, x: 20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="flex-1 p-8 bg-white rounded-2xl shadow-soft"
          >
            <Building2 className="w-12 h-12 text-obsidian mb-6" />
            <h3 className="text-2xl font-semibold mb-6 text-obsidian">For Brands</h3>
            <ul className="space-y-4">
              {brandPoints.map((point, index) => (
                <li key={index} className="flex items-center gap-3">
                  <CheckCircle className="w-5 h-5 text-blush" />
                  <span className="text-graphite">{point}</span>
                </li>
              ))}
            </ul>
          </motion.div>
        </div>
        
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="text-center text-graphite mt-12"
        >
          Affynity lets both sides move with purpose.
        </motion.p>
      </div>
    </section>
  );
}