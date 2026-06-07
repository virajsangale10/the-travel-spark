"use client";

import { useState } from "react";
import { tours, categories } from "@/lib/data";
import TourCard from "./TourCard";

export default function Tours() {
  const [activeCategory, setActiveCategory] = useState("All");

  const filteredTours =
    activeCategory === "All"
      ? tours
      : tours.filter((tour) => tour.category === activeCategory);

  return (
    <section id="tours" className="py-20 bg-primary-dark text-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="text-center mb-16">
          <div className="inline-block mb-4 px-4 py-2 bg-accent/20 rounded-full">
            <span className="text-accent font-bold text-sm uppercase tracking-wider">
              Featured Experiences
            </span>
          </div>
          <h2 className="text-4xl md:text-5xl font-bold mb-6">
            Our Most Popular <span className="text-accent">Tours</span>
          </h2>
          <p className="text-lg text-white/70 max-w-2xl mx-auto">
            Handpicked destinations and expertly curated itineraries for unforgettable adventures
          </p>
        </div>

        {/* Category Filter */}
        <div className="flex flex-wrap gap-3 justify-center mb-16">
          {categories.map((category) => (
            <button
              key={category}
              onClick={() => setActiveCategory(category)}
              className={`px-6 py-2.5 rounded-full font-semibold transition-smooth ${
                activeCategory === category
                  ? "bg-gradient-to-r from-accent to-accent-dark text-primary-dark shadow-lg"
                  : "bg-white/10 text-white hover:bg-white/20"
              }`}
            >
              {category}
            </button>
          ))}
        </div>

        {/* Tours Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {filteredTours.map((tour) => (
            <TourCard key={tour.id} tour={tour} />
          ))}
        </div>

        {/* View All Button */}
        <div className="text-center mt-16">
          <button className="px-8 py-3.5 bg-gradient-to-r from-accent to-accent-dark text-primary-dark font-bold rounded-lg hover:shadow-lg transition-smooth hover:-translate-y-1 text-lg">
            Explore All Tours
          </button>
        </div>
      </div>
    </section>
  );
}
