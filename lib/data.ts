export interface Tour {
  id: string;
  name: string;
  destination: string;
  duration: string;
  price: string;
  image?: string;
  category: string;
  rating: number;
  reviews: number;
  description: string;
}

export interface BlogPost {
  id: string;
  title: string;
  slug: string;
  excerpt: string;
  date: string;
  image?: string;
  category: string;
}

export interface Testimonial {
  id: string;
  name: string;
  role: string;
  content: string;
  rating: number;
  image?: string;
}

// Featured Tours Data
export const tours: Tour[] = [
  {
    id: "1",
    name: "Mystical Kashmir",
    destination: "Kashmir, India",
    duration: "7 Days",
    price: "$1,299",
    category: "Mountain",
    rating: 4.8,
    reviews: 342,
    description: "Explore the breathtaking valleys and pristine lakes of Kashmir with expert guides."
  },
  {
    id: "2",
    name: "Maldives Paradise",
    destination: "Maldives",
    duration: "5 Days",
    price: "$1,899",
    category: "Beach",
    rating: 4.9,
    reviews: 521,
    description: "Luxury island getaway with crystal-clear waters and world-class resorts."
  },
  {
    id: "3",
    name: "Paris Dreams",
    destination: "Paris, France",
    duration: "6 Days",
    price: "$1,599",
    category: "Culture",
    rating: 4.7,
    reviews: 298,
    description: "Immerse yourself in the art, culture, and romance of Europe's most beautiful city."
  },
  {
    id: "4",
    name: "Dubai Glamour",
    destination: "Dubai, UAE",
    duration: "4 Days",
    price: "$999",
    category: "Luxury",
    rating: 4.6,
    reviews: 415,
    description: "Experience luxury shopping, stunning architecture, and desert adventures."
  },
  {
    id: "5",
    name: "Singapore Modern",
    destination: "Singapore",
    duration: "5 Days",
    price: "$1,299",
    category: "Urban",
    rating: 4.7,
    reviews: 267,
    description: "Discover the perfect blend of modern innovation and Eastern traditions."
  },
  {
    id: "6",
    name: "Kerala Backwaters",
    destination: "Kerala, India",
    duration: "6 Days",
    price: "$899",
    category: "Nature",
    rating: 4.8,
    reviews: 389,
    description: "Serene houseboats, lush greenery, and authentic spice trade routes."
  },
];

// Blog Posts Data
export const blogPosts: BlogPost[] = [
  {
    id: "1",
    title: "10 Travel Hacks for Indian Travellers",
    slug: "10-travel-hacks-indian-travellers",
    excerpt: "Discover insider tips to make your international travels smoother, faster, and cheaper.",
    date: "2024-03-15",
    category: "Tips & Tricks"
  },
  {
    id: "2",
    title: "Dubai on a Budget: Complete Guide",
    slug: "dubai-on-a-budget",
    excerpt: "Explore the luxury city without breaking the bank with our budget travel guide.",
    date: "2024-03-10",
    category: "Budget Travel"
  },
  {
    id: "3",
    title: "Kashmir Winter vs Summer: Which is Better?",
    slug: "kashmir-winter-vs-summer",
    excerpt: "A detailed comparison to help you choose the perfect time to visit Kashmir.",
    date: "2024-03-05",
    category: "Destination Guide"
  },
  {
    id: "4",
    title: "Plan Your Perfect Maldives Honeymoon",
    slug: "plan-perfect-maldives-honeymoon",
    excerpt: "Complete honeymoon planning guide with resort recommendations and insider tips.",
    date: "2024-02-28",
    category: "Honeymoon"
  },
  {
    id: "5",
    title: "7-Day Singapore & Malaysia Itinerary",
    slug: "singapore-malaysia-7-days-itinerary",
    excerpt: "Maximize your Southeast Asia trip with this perfectly planned week-long adventure.",
    date: "2024-02-20",
    category: "Itineraries"
  },
];

// Testimonials Data
export const testimonials: Testimonial[] = [
  {
    id: "1",
    name: "Priya Sharma",
    role: "Adventure Enthusiast",
    content: "The Travel Spark made my dream vacation a reality. Exceptional service and unforgettable memories!",
    rating: 5
  },
  {
    id: "2",
    name: "Rajesh Kumar",
    role: "Honeymoon Traveler",
    content: "Best travel agency ever. They handled every detail perfectly. Highly recommended!",
    rating: 5
  },
  {
    id: "3",
    name: "Neha Patel",
    role: "Family Travel",
    content: "From booking to return, everything was smooth. Great packages and amazing support team.",
    rating: 4.8
  },
  {
    id: "4",
    name: "Amit Singh",
    role: "Solo Traveler",
    content: "Affordable and reliable. I've booked with them multiple times and never been disappointed.",
    rating: 4.9
  },
];

export const categories = ["All", "Mountain", "Beach", "Culture", "Luxury", "Urban", "Nature"];
