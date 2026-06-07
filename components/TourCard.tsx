import { Tour } from "@/lib/data";
import Image from "next/image";

interface TourCardProps {
  tour: Tour;
}

export default function TourCard({ tour }: TourCardProps) {
  return (
    <div className="group bg-white rounded-xl overflow-hidden shadow-md hover:shadow-xl transition-smooth hover:-translate-y-1 border border-white/20">
      {/* Image Container */}
      <div className="relative h-56 bg-gradient-to-br from-primary/20 to-accent/20 overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-tr from-primary-dark/30 to-transparent group-hover:from-primary-dark/50 transition-smooth" />
        <div className="absolute inset-0 flex items-center justify-center text-white">
          <div className="text-center">
            <div className="text-4xl font-bold mb-2">{tour.destination.split(",")[0]}</div>
            <p className="text-white/80">{tour.category}</p>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="p-6">
        {/* Category Badge */}
        <div className="inline-block mb-3 px-3 py-1 bg-accent/10 rounded-full">
          <span className="text-accent font-semibold text-xs uppercase tracking-wider">
            {tour.category}
          </span>
        </div>

        {/* Title */}
        <h3 className="text-xl font-bold text-primary-dark mb-2 group-hover:text-primary transition-smooth">
          {tour.name}
        </h3>

        {/* Destination & Duration */}
        <div className="flex items-center gap-4 text-sm text-text-muted mb-4">
          <div className="flex items-center gap-1">
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
            </svg>
            {tour.destination}
          </div>
        </div>

        <div className="flex items-center gap-4 text-sm text-text-muted mb-4">
          <div className="flex items-center gap-1">
            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v2a1 1 0 001 1h1v5a2 2 0 002 2h8a2 2 0 002-2v-5h1a1 1 0 001-1V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5v5h8V7H6z" clipRule="evenodd" />
            </svg>
            {tour.duration}
          </div>
        </div>

        {/* Rating */}
        <div className="flex items-center gap-2 mb-4">
          <div className="flex items-center gap-1">
            {Array.from({ length: 5 }).map((_, i) => (
              <svg
                key={i}
                className={`w-4 h-4 ${i < Math.floor(tour.rating) ? "text-accent fill-current" : "text-gray-300"}`}
                viewBox="0 0 20 20"
              >
                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
              </svg>
            ))}
          </div>
          <span className="text-xs font-semibold text-primary-dark">{tour.rating}</span>
          <span className="text-xs text-text-muted">({tour.reviews} reviews)</span>
        </div>

        {/* Price & Button */}
        <div className="flex items-center justify-between pt-4 border-t border-border">
          <div>
            <p className="text-xs text-text-muted mb-1">Starting from</p>
            <p className="text-2xl font-bold text-primary-dark">{tour.price}</p>
          </div>
          <button className="px-4 py-2 bg-gradient-to-r from-primary to-primary-dark text-white font-semibold rounded-lg hover:shadow-md transition-smooth hover:-translate-y-0.5">
            Book Now
          </button>
        </div>
      </div>
    </div>
  );
}
