import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "The Travel Spark - Unforgettable Travel Experiences",
  description: "Discover and book amazing travel packages to world's most beautiful destinations. Expert travel planning for every adventurer.",
  keywords: "travel, tours, vacation, packages, flights, hotels, adventure",
  authors: [{ name: "The Travel Spark" }],
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://thetravelspark.com",
    title: "The Travel Spark - Unforgettable Travel Experiences",
    description: "Discover and book amazing travel packages to world's most beautiful destinations",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={`${geistSans.variable} ${geistMono.variable} scroll-smooth`}
    >
      <body className="bg-background text-foreground">{children}</body>
    </html>
  );
}
