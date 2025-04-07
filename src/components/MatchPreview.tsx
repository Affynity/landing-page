import { motion } from 'framer-motion';

export default function MatchPreview() {
  return (
    <section className="py-24 bg-porcelain">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="text-center max-w-2xl mx-auto mb-16"
        >
          <h2 className="text-3xl md:text-4xl font-bold text-obsidian mb-4">
            Collaboration should feel intuitive.
          </h2>
          <p className="text-graphite text-lg">
            Affynity makes connection easy, swipe by swipe.
          </p>
        </motion.div>

        <div className="flex flex-col md:flex-row gap-8 justify-center items-center">
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="w-full max-w-sm bg-white rounded-2xl shadow-soft p-6"
          >
            <img
              src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=800&q=80"
              alt="Creator Profile"
              className="w-full h-64 object-cover rounded-xl mb-4"
            />
            <div className="flex gap-2 mb-4">
              <span className="px-3 py-1 bg-lilac rounded-full text-sm">Lifestyle</span>
              <span className="px-3 py-1 bg-sage rounded-full text-sm">Wellness</span>
            </div>
            <h3 className="text-xl font-semibold mb-2">Sarah Chen</h3>
            <p className="text-graphite">150K+ Following</p>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, x: 20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="w-full max-w-sm bg-white rounded-2xl shadow-soft p-6"
          >
            <img
              src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?auto=format&fit=crop&w=800&q=80"
              alt="Brand Campaign"
              className="w-full h-64 object-cover rounded-xl mb-4"
            />
            <div className="flex gap-2 mb-4">
              <span className="px-3 py-1 bg-gold rounded-full text-sm">$5K Budget</span>
              <span className="px-3 py-1 bg-blush rounded-full text-sm">3 Month</span>
            </div>
            <h3 className="text-xl font-semibold mb-2">Ritual Beauty</h3>
            <p className="text-graphite">Seeking: Authentic Beauty Stories</p>
          </motion.div>
        </div>
      </div>
    </section>
  );
}