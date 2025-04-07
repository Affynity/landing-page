import { motion, AnimatePresence } from 'framer-motion';
import { useState } from 'react';

export default function CTA() {
  const [email, setEmail] = useState('');
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (email.trim()) {
      console.log('Email submitted:', email);
      setIsSubmitted(true);
    }
  };

  const handleEmailChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setEmail(e.target.value);
  };

  return (
    <section className="py-24 bg-porcelain">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="max-w-2xl mx-auto"
        >
          <AnimatePresence mode="wait">
            {!isSubmitted ? (
              <motion.div
                key="form"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0, scale: 0.95 }}
                className="text-center"
              >
                <h2 className="text-3xl md:text-4xl font-bold text-obsidian mb-4">
                  Be part of something real.
                </h2>
                <p className="text-lg text-graphite mb-8">
                  Affynity is launching soon. Join the waitlist to be among the first to match.
                </p>
                <motion.form
                  onSubmit={handleSubmit}
                  className="flex flex-col sm:flex-row gap-4 justify-center"
                >
                  <div className="flex-1 max-w-md">
                    <input
                      type="email"
                      placeholder="Enter your email"
                      value={email}
                      onChange={handleEmailChange}
                      className="w-full px-6 py-4 rounded-xl bg-white border-2 border-stone focus:outline-none focus:border-blush transition-colors"
                      required
                    />
                  </div>
                  <button
                    type="submit"
                    className="whitespace-nowrap px-8 py-4 bg-blush hover:bg-blush/90 text-obsidian font-medium rounded-xl transition-all hover:shadow-soft active:scale-[0.98]"
                  >
                    Get Early Access
                  </button>
                </motion.form>
              </motion.div>
            ) : (
              <motion.div
                key="success"
                initial={{ opacity: 0, scale: 0.9 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ 
                  type: "spring",
                  stiffness: 200,
                  damping: 20
                }}
                className="bg-sage/20 p-8 rounded-2xl text-center"
              >
                <motion.div
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: 0.2 }}
                >
                  <h3 className="text-2xl font-semibold mb-2">You're on the list!</h3>
                  <p className="text-graphite">
                    Thanks for joining. We'll keep you updated on our launch progress.
                  </p>
                </motion.div>
              </motion.div>
            )}
          </AnimatePresence>
        </motion.div>
      </div>
    </section>
  );
}