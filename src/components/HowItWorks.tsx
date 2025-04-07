import { motion } from 'framer-motion';
import { Target, Sparkles, HandshakeIcon } from 'lucide-react';

const steps = [
  {
    icon: Target,
    title: "Set your intention",
    description: "Choose your audience, vibe, and campaign goals."
  },
  {
    icon: Sparkles,
    title: "Swipe with clarity",
    description: "Match with aligned brands or creators—instantly, naturally."
  },
  {
    icon: HandshakeIcon,
    title: "Collaborate your way",
    description: "Send offers, share media kits, start your next partnership."
  }
];

export default function HowItWorks() {
  return (
    <section className="py-24 bg-ivory">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="max-w-3xl mx-auto"
        >
          <div className="space-y-16">
            {steps.map((step, index) => (
              <motion.div
                key={step.title}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.8, delay: index * 0.2 }}
                className="flex gap-8 items-start"
              >
                <div className="w-12 h-12 rounded-xl bg-blush/20 flex items-center justify-center flex-shrink-0">
                  <step.icon className="w-6 h-6 text-obsidian" />
                </div>
                <div>
                  <h3 className="text-xl font-semibold mb-2 text-obsidian">{step.title}</h3>
                  <p className="text-graphite">{step.description}</p>
                </div>
              </motion.div>
            ))}
          </div>
        </motion.div>
      </div>
    </section>
  );
}