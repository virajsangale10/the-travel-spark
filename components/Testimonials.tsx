import { testimonials } from "@/lib/data";

export default function Testimonials() {
  return (
    <section id="testimonials" className="py-20 bg-gradient-to-br from-background to-border-light">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="text-center mb-16">
          <div className="inline-block mb-4 px-4 py-2 bg-accent/10 rounded-full">
            <span className="text-accent font-bold text-sm uppercase tracking-wider">
              Happy Travelers
            </span>
          </div>
          <h2 className="text-4xl md:text-5xl font-bold text-primary-dark mb-6">
            What Our Clients <span className="text-accent">Say</span>
          </h2>
          <p className="text-lg text-text-muted max-w-2xl mx-auto">
            Real stories from real travelers who've experienced unforgettable journeys with us
          </p>
        </div>

        {/* Testimonials Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {testimonials.map((testimonial) => (
            <div
              key={testimonial.id}
              className="bg-white rounded-xl p-6 shadow-sm hover:shadow-md transition-smooth border border-border hover:border-primary/30 group"
            >
              {/* Stars */}
              <div className="flex gap-1 mb-4">
                {Array.from({ length: 5 }).map((_, i) => (
                  <svg
                    key={i}
                    className={`w-4 h-4 ${
                      i < testimonial.rating ? "text-accent fill-current" : "text-gray-300"
                    }`}
                    viewBox="0 0 20 20"
                  >
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                ))}
              </div>

              {/* Quote */}
              <p className="text-foreground mb-6 leading-relaxed italic">
                "{testimonial.content}"
              </p>

              {/* Author */}
              <div className="border-t border-border pt-4">
                <p className="font-bold text-primary-dark group-hover:text-primary transition-smooth">
                  {testimonial.name}
                </p>
                <p className="text-sm text-text-muted">{testimonial.role}</p>
              </div>
            </div>
          ))}
        </div>

        {/* Trust Metrics */}
        <div className="mt-20 grid grid-cols-3 gap-8 max-w-3xl mx-auto text-center">
          <div>
            <div className="text-4xl font-bold text-primary-dark mb-2">50K+</div>
            <p className="text-text-muted">Satisfied Customers</p>
          </div>
          <div className="border-l border-r border-border">
            <div className="text-4xl font-bold text-primary-dark mb-2">4.8★</div>
            <p className="text-text-muted">Average Rating</p>
          </div>
          <div>
            <div className="text-4xl font-bold text-primary-dark mb-2">10Y+</div>
            <p className="text-text-muted">Experience</p>
          </div>
        </div>
      </div>
    </section>
  );
}
