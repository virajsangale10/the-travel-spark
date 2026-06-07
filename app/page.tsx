import Navbar from "@/components/Navbar";
import Hero from "@/components/Hero";
import Tours from "@/components/Tours";
import Testimonials from "@/components/Testimonials";
import Blog from "@/components/Blog";
import Footer from "@/components/Footer";

export default function Home() {
  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      <Hero />
      <Tours />
      <Testimonials />
      <Blog />
      <Footer />
    </div>
  );
}
