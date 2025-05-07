//
//  PricingView.swift
//  DroneApp
//
//  Created by Safak Yaral on 6.05.2025.
//

import SwiftUI

struct PricingView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var contentWidth: CGFloat = 0
      
var body: some View {
       
        ScrollView {
        VStack(alignment: .leading, spacing: 16) {
                Text("Our Plans")
                            .font(.title)
                            .padding(.bottom, 4)

                        // Pricing plans with snapping and scroll indicator
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 12) {
                                PlanCard(title: "Basic", price: "$99/mo",
                                         features: ["60-min battery", "GPS mapping"])
                                PlanCard(title: "Pro", price: "$199/mo",
                                         features: ["120-min battery", "Live NDVI data"])
                                PlanCard(title: "Premium", price: "$299/mo",
                                         features: ["180-min battery", "Advanced analytics"])
                                PlanCard(title: "Enterprise", price: "$499/mo",
                                         features: ["240-min battery", "Custom integrations"])
                                PlanCard(title: "Starter", price: "$49/mo",
                                         features: ["30-min battery", "Basic mapping"])
                                PlanCard(title: "Advanced", price: "$149/mo",
                                         features: ["90-min battery", "Weather alerts"])
                                PlanCard(title: "Ultimate", price: "$399/mo",
                                         features: ["210-min battery", "AI-powered insights"])
                                PlanCard(title: "Business", price: "$249/mo",
                                         features: ["150-min battery", "Team collaboration"])
                                PlanCard(title: "Elite", price: "$349/mo",
                                         features: ["200-min battery", "Priority support"])
                                PlanCard(title: "Standard", price: "$79/mo",
                                         features: ["45-min battery", "Standard support"])
                            }
                            .padding(.horizontal)
                            .background(
                                GeometryReader { geo in
                                    Color.clear.onAppear {
                                        contentWidth = geo.size.width
                                    }
                                }
                            )
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .overlay(
                            GeometryReader { geo in
                                Color.clear.onChange(of: geo.frame(in: .global).minX) { _, newValue in
                                    scrollOffset = newValue
                                }
                            }
                        )

                        // Scroll indicator
                        HStack {
                            Spacer()
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: 50, height: 4)
                                .offset(x: scrollOffset)
                            Spacer()
                        }
                        .padding(.top, 8)

                        Divider().padding(.vertical)

                        // Testimonials
                        Text("Testimonials")
                            .font(.headline)
                        VStack(alignment: .leading, spacing: 12) {
                            TestimonialCard(quote: "This drone doubled my yield!", author: "– Farmer Jane")
                            TestimonialCard(quote: "Easy to use and rugged. Highly recommend.", author: "– Farmer Bob")
                            TestimonialCard(quote: "The best investment for my farm. Worth every penny.", author: "– Farmer John")
                            TestimonialCard(quote: "Incredible precision and coverage. A game-changer.", author: "– Farmer Sarah")
                            TestimonialCard(quote: "Saves me hours of manual work. Absolutely love it.", author: "– Farmer Mike")
                            TestimonialCard(quote: "The support team is amazing. Great product!", author: "– Farmer Lisa")
                            TestimonialCard(quote: "Perfect for large fields. Very efficient.", author: "– Farmer Tom")
                            TestimonialCard(quote: "Reliable and powerful. Exactly what I needed.", author: "– Farmer Emma")
                            TestimonialCard(quote: "The data insights are invaluable. Highly recommended.", author: "– Farmer David")
                            TestimonialCard(quote: "A must-have for modern farming. Outstanding performance.", author: "– Farmer Anna")
                        }

                        Spacer()

                        // Contact CTA
                        Button(action: {
                            // Contact action
                        }) {
                            Text("Go To Payments")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                .background(Color(.systemBackground))
            }
        }

        struct PlanCard: View {
            var title: String
            var price: String
            var features: [String]
            var body: some View {
                VStack(spacing: 8) {
                    Text(title).font(.headline)
                    Text(price).font(.title2).fontWeight(.bold)
                    ForEach(features, id: \.self) { feat in
                        Text("• \(feat)").font(.subheadline)
                    }
                }
                .padding()
                .frame(width: 200)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .shadow(radius: 2)
            }
        }

        struct TestimonialCard: View {
            var quote: String
            var author: String
            var body: some View {
                VStack(alignment: .leading) {
                    Text("\(quote)")
                        .italic()
                    Text(author)
                        .font(.subheadline)
                        .padding(.top, 4)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .shadow(radius: 1)
            }
        }

        #Preview {
            PricingView()
        }
    


#Preview {
    PricingView()
}
