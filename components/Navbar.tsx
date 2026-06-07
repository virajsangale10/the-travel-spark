"use client";

import { useState } from "react";
import Link from "next/link";

export default function Navbar() {
  const [isScrolled, setIsScrolled] = useState(false);

  if (typeof window !== "undefined") {
    window.addEventListener("scroll", () => {
      setIsScrolled(window.scrollY > 50);
    });
  }

  return (
    <nav
      className={`fixed top-0 left-0 right-0 z-50 transition-smooth ${
        isScrolled ? "bg-background/95 backdrop-blur shadow-sm border-b border-border" : "bg-transparent"
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center justify-between">
        {/* Logo */}
        <Link href="/" className="flex items-center gap-2 group">
          <div className="w-10 h-10 bg-gradient-to-br from-primary to-accent rounded-lg flex items-center justify-center">
            <span className="text-white font-bold text-lg">TS</span>
          </div>
          <span className="text-xl font-bold text-primary-dark group-hover:text-primary transition-smooth">
            Travel Spark
          </span>
        </Link>

        {/* Navigation Links */}
        <div className="hidden md:flex items-center gap-8">
          <Link
            href="#tours"
            className="text-foreground hover:text-primary transition-smooth font-medium"
          >
            Tours
          </Link>
          <Link
            href="#blog"
            className="text-foreground hover:text-primary transition-smooth font-medium"
          >
            Blog
          </Link>
          <Link
            href="#testimonials"
            className="text-foreground hover:text-primary transition-smooth font-medium"
          >
            Testimonials
          </Link>
          <Link
            href="#contact"
            className="text-foreground hover:text-primary transition-smooth font-medium"
          >
            Contact
          </Link>
        </div>

        {/* CTA Button */}
        <div className="hidden md:block">
          <button className="px-6 py-2.5 bg-gradient-to-r from-accent to-accent-dark text-primary-dark font-bold rounded-lg hover:shadow-medium transition-smooth hover:-translate-y-0.5">
            Book Now
          </button>
        </div>

        {/* Mobile Menu Button */}
        <button className="md:hidden p-2 rounded-lg hover:bg-border-light transition-smooth">
          <svg
            className="w-6 h-6"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M4 6h16M4 12h16M4 18h16"
            />
          </svg>
        </button>
      </div>
    </nav>
  );
}
