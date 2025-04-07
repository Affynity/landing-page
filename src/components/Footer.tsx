import { Twitter, Instagram, Linkedin } from 'lucide-react';

export default function Footer() {
  return (
    <footer className="py-12 bg-ivory border-t border-stone">
      <div className="container mx-auto px-4">
        <div className="flex flex-col md:flex-row justify-between items-center gap-8">
          <div>
            <span className="text-lg font-bold tracking-tight">affynity</span>
          </div>
          
          <div className="flex items-center gap-6">
            <a href="#" className="text-graphite hover:text-obsidian transition-colors">
              <Twitter className="w-5 h-5" />
            </a>
            <a href="#" className="text-graphite hover:text-obsidian transition-colors">
              <Instagram className="w-5 h-5" />
            </a>
            <a href="#" className="text-graphite hover:text-obsidian transition-colors">
              <Linkedin className="w-5 h-5" />
            </a>
          </div>
          
          <div className="text-sm text-graphite">
            © {new Date().getFullYear()} Affynity. All rights reserved.
          </div>
        </div>
      </div>
    </footer>
  );
}