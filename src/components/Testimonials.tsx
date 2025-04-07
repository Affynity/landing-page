import { motion } from 'framer-motion';
import { Quote } from 'lucide-react';

const testimonials = [
  {
    quote: "Affynity finally made brand deals feel human.",
    author: "@StudioAsha",
    image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=800&q=80"
  },
  {
    quote: "We stopped mass emailing and started actually matching.",
    author: "Brand Manager, Ritual Beauty",
    image: "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=800&q=80"
  }
];

export default function Testimonials() {
  return (
    <section className="py-24 bg-ivory">
      <div className="container mx-auto px-4">
        <div className="grid md:grid-cols-2 gap-8">
          {testimonials.map((testimonial, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.8, delay: index * 0.2 }}
              className="bg-white p-8 rounded-2xl shadow-soft hover:shadow-lg transition-shadow"
            >
              <Quote className="w-8 h-8 text-blush mb-6" />
              <div className="flex gap-4 items-center mb-6">
                <img
                  src={testimonial.image}
                  alt={testimonial.author}
                  className="w-12 h-12 rounded-full object-cover"
                />
                <span className="text-sm text-graphite">{testimonial.author}</span>
              </div>
              <p className="text-lg text-obsidian">{testimonial.quote}</p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}