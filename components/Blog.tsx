import { blogPosts } from "@/lib/data";
import BlogCard from "./BlogCard";

export default function Blog() {
  return (
    <section id="blog" className="py-20 bg-background">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="text-center mb-16">
          <div className="inline-block mb-4 px-4 py-2 bg-accent/10 rounded-full">
            <span className="text-accent font-bold text-sm uppercase tracking-wider">
              Travel Tips & Stories
            </span>
          </div>
          <h2 className="text-4xl md:text-5xl font-bold text-primary-dark mb-6">
            Latest Articles & <span className="text-accent">Guides</span>
          </h2>
          <p className="text-lg text-text-muted max-w-2xl mx-auto">
            Discover travel inspiration, tips, and insider guides for your next adventure
          </p>
        </div>

        {/* Featured Article (First Post) */}
        {blogPosts.length > 0 && (
          <div className="mb-16 grid grid-cols-1 lg:grid-cols-2 gap-8 items-center">
            <div className="relative h-96 bg-gradient-to-br from-primary/20 to-accent/20 rounded-xl overflow-hidden group">
              <div className="absolute inset-0 bg-gradient-to-tr from-primary-dark/40 to-transparent group-hover:from-primary-dark/60 transition-smooth" />
              <div className="absolute inset-0 flex items-center justify-center text-white text-center">
                <div>
                  <div className="text-5xl font-bold mb-3">Featured</div>
                  <p className="text-white/80">Travel Guide</p>
                </div>
              </div>
            </div>

            <div>
              <div className="inline-block mb-3 px-3 py-1 bg-accent/10 rounded-full">
                <span className="text-accent font-semibold text-xs uppercase tracking-wider">
                  {blogPosts[0].category}
                </span>
              </div>
              <h3 className="text-3xl font-bold text-primary-dark mb-4">
                {blogPosts[0].title}
              </h3>
              <p className="text-text-muted text-lg mb-6 leading-relaxed">
                {blogPosts[0].excerpt}
              </p>
              <div className="flex items-center gap-6">
                <span className="text-sm text-text-muted">{blogPosts[0].date}</span>
                <button className="px-6 py-2.5 bg-gradient-to-r from-primary to-primary-dark text-white font-semibold rounded-lg hover:shadow-md transition-smooth hover:-translate-y-0.5">
                  Read More
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Blog Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {blogPosts.slice(1).map((post) => (
            <BlogCard key={post.id} post={post} />
          ))}
        </div>

        {/* View All Button */}
        <div className="text-center mt-16">
          <button className="px-8 py-3.5 bg-gradient-to-r from-accent to-accent-dark text-primary-dark font-bold rounded-lg hover:shadow-lg transition-smooth hover:-translate-y-1 text-lg">
            View All Articles
          </button>
        </div>
      </div>
    </section>
  );
}
