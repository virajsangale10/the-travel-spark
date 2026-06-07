import { BlogPost } from "@/lib/data";

interface BlogCardProps {
  post: BlogPost;
}

export default function BlogCard({ post }: BlogCardProps) {
  return (
    <div className="group bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-lg transition-smooth hover:-translate-y-1 border border-border hover:border-primary/30">
      {/* Image Container */}
      <div className="relative h-48 bg-gradient-to-br from-primary/20 to-accent/20 overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-tr from-primary-dark/30 to-transparent group-hover:from-primary-dark/50 transition-smooth" />
        <div className="absolute inset-0 flex items-center justify-center">
          <svg className="w-16 h-16 text-accent/30 group-hover:text-accent/50 transition-smooth" fill="currentColor" viewBox="0 0 20 20">
            <path d="M2 4a2 2 0 012-2h6a2 2 0 012 2v12a1 1 0 100 2H4a2 2 0 01-2-2V4zm12.816 3.182a.5.5 0 00-.765.545l.975 3.9a.5.5 0 00.494.368h4.478a.5.5 0 00.494-.368l.975-3.9a.5.5 0 00-.765-.545l-.88 3.52H14.88l-.064-.255zm0 6a.5.5 0 00-.765.545l.975 3.9a.5.5 0 00.494.368h4.478a.5.5 0 00.494-.368l.975-3.9a.5.5 0 00-.765-.545l-.88 3.52H14.88l-.064-.255z" />
          </svg>
        </div>
      </div>

      {/* Content */}
      <div className="p-6">
        {/* Category Badge */}
        <div className="inline-block mb-3 px-3 py-1 bg-primary/10 rounded-full">
          <span className="text-primary font-semibold text-xs uppercase tracking-wider">
            {post.category}
          </span>
        </div>

        {/* Title */}
        <h3 className="text-lg font-bold text-primary-dark mb-3 group-hover:text-primary transition-smooth line-clamp-2">
          {post.title}
        </h3>

        {/* Excerpt */}
        <p className="text-text-muted text-sm mb-4 line-clamp-2 leading-relaxed">
          {post.excerpt}
        </p>

        {/* Footer */}
        <div className="border-t border-border pt-4 flex items-center justify-between">
          <span className="text-xs text-text-muted font-medium">
            {new Date(post.date).toLocaleDateString("en-US", {
              month: "short",
              day: "numeric",
              year: "numeric",
            })}
          </span>
          <button className="text-primary font-semibold text-sm hover:text-primary-dark transition-smooth flex items-center gap-2 group/btn">
            Read <svg className="w-4 h-4 group-hover/btn:translate-x-1 transition-smooth" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  );
}
