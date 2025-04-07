import { motion, AnimatePresence } from 'framer-motion';
import { useState, useRef, useEffect } from 'react';

export default function Hero() {
  const [email, setEmail] = useState('');
  const [isSubmitted, setIsSubmitted] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    // Focus the input on component mount
    if (inputRef.current) {
      inputRef.current.focus();
    }
  }, []);

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
    <section className="min-h-screen bg-ivory relative overflow-hidden">
      <div className="absolute inset-0 bg-gradient-to-br from-transparent to-blush/10" />
      
      <div className="container mx-auto px-4 pt-8 lg:pt-16">
        <motion.div 
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.5 }}
          className="mb-16"
        >
          <span className="text-2xl font-bold tracking-tight">affynity</span>
        </motion.div>

        <div className="max-w-2xl">
          <motion.h1 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2, duration: 0.8 }}
            className="text-4xl md:text-6xl font-bold text-obsidian mb-6"
          >
            Where creators and brands align.
          </motion.h1>

          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.4, duration: 0.8 }}
            className="text-lg md:text-xl text-graphite mb-12"
          >
            Affynity connects people who are meant to collaborate—with intention, style, and ease.
          </motion.p>

          <AnimatePresence mode="wait">
            {!isSubmitted ? (
              <motion.form
                key="form"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, scale: 0.95 }}
                transition={{ duration: 0.4 }}
                onSubmit={handleSubmit}
                className="relative flex flex-col sm:flex-row gap-4"
              >
                <div className="flex-1">
                  <input
                    ref={inputRef}
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
                  Join the Waitlist
                </button>
              </motion.form>
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
                  <h3 className="text-2xl font-semibold mb-2">Welcome to Affynity!</h3>
                  <p className="text-graphite">
                    We'll notify you when we're ready to launch. Get ready for a new way to collaborate.
                  </p>
                </motion.div>
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </div>
    </section>
  );
}