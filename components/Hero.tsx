"use client";

import { useState } from "react";

export default function Hero() {
  const [tripType, setTripType] = useState("round-trip");

  return (
    <section className="relative min-h-screen pt-20 pb-16 overflow-hidden">
      {/* Gradient Background */}
      <div className="absolute inset-0 bg-gradient-to-br from-blue-50 via-blue-100 to-blue-50 -z-10" />

      {/* Decorative Elements */}
      <div className="absolute top-40 right-10 w-96 h-96 bg-accent/10 rounded-full blur-3xl -z-10" />
      <div className="absolute bottom-0 left-10 w-96 h-96 bg-primary/5 rounded-full blur-3xl -z-10" />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Hero Content */}
        <div className="text-center mb-16 pt-12">
          <div className="inline-block mb-6 px-4 py-2 bg-accent/10 rounded-full">
            <span className="text-accent font-bold text-sm uppercase tracking-wider">
              Explore the World
            </span>
          </div>

          <h1 className="text-5xl md:text-6xl lg:text-7xl font-bold text-primary-dark mb-6 leading-tight">
            Your Journey to{" "}
            <span className="text-gradient">Unforgettable</span> Moments
          </h1>

          <p className="text-lg md:text-xl text-text-muted max-w-3xl mx-auto mb-12 leading-relaxed">
            Discover and book world-class travel experiences. From mountain adventures to beach paradise, we&apos;ve got your perfect getaway waiting.
          </p>

          {/* Stats */}
          <div className="grid grid-cols-3 gap-8 mb-16 max-w-2xl mx-auto">
            <div className="flex flex-col items-center">
              <div className="text-3xl md:text-4xl font-bold text-primary-dark mb-2">
                50K+
              </div>
              <p className="text-sm text-text-muted font-medium">Happy Travelers</p>
            </div>
            <div className="flex flex-col items-center border-l border-r border-border">
              <div className="text-3xl md:text-4xl font-bold text-primary-dark mb-2">
                200+
              </div>
              <p className="text-sm text-text-muted font-medium">Destinations</p>
            </div>
            <div className="flex flex-col items-center">
              <div className="text-3xl md:text-4xl font-bold text-primary-dark mb-2">
                98%
              </div>
              <p className="text-sm text-text-muted font-medium">Satisfaction</p>
            </div>
          </div>
        </div>

        {/* Search Form */}
        <div className="max-w-5xl mx-auto">
          <div className="bg-white rounded-2xl shadow-lg p-8 border border-border">
            {/* Trip Type */}
            <div className="mb-8 flex gap-6">
              <label className="flex items-center gap-3 cursor-pointer group">
                <input
                  type="radio"
                  value="round-trip"
                  checked={tripType === "round-trip"}
                  onChange={(e) => setTripType(e.target.value)}
                  className="w-5 h-5 accent-accent"
                />
                <span className="font-medium text-foreground group-hover:text-primary transition-smooth">
                  Round Trip
                </span>
              </label>
              <label className="flex items-center gap-3 cursor-pointer group">
                <input
                  type="radio"
                  value="one-way"
                  checked={tripType === "one-way"}
                  onChange={(e) => setTripType(e.target.value)}
                  className="w-5 h-5 accent-accent"
                />
                <span className="font-medium text-foreground group-hover:text-primary transition-smooth">
                  One Way
                </span>
              </label>
            </div>

            {/* Form Inputs */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  From
                </label>
                <input
                  type="text"
                  placeholder="Departure city"
                  className="w-full px-4 py-3 border border-border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-smooth"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  To
                </label>
                <input
                  type="text"
                  placeholder="Destination"
                  className="w-full px-4 py-3 border border-border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-smooth"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Depart
                </label>
                <input
                  type="date"
                  className="w-full px-4 py-3 border border-border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-smooth"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-foreground mb-2">
                  Travelers
                </label>
                <select className="w-full px-4 py-3 border border-border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-smooth">
                  <option>1 Person</option>
                  <option>2 People</option>
                  <option>3 People</option>
                  <option>4+ People</option>
                </select>
              </div>
            </div>

            {/* Search Button */}
            <button className="w-full bg-gradient-to-r from-accent to-accent-dark hover:shadow-medium text-primary-dark font-bold py-3 rounded-lg transition-smooth hover:-translate-y-1 flex items-center justify-center gap-2">
              <span>Search Tours</span>
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </button>
          </div>
        </div>
      </div>
    </section>
  );
}
