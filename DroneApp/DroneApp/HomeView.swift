//
//  HomeView.swift
//  DroneApp
//
//  Created by Safak Yaral on 6.05.2025.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
            VStack {
                      // Hero image
                      Image("drone2")
                          .resizable()
                          .scaledToFill()
                          .cornerRadius(8)
                          .shadow(radius: 4)
                      
                      // Title and tagline
                      Text("Precision Farming Drone")
                          .foregroundStyle(.white)
                          .font(.largeTitle)
                          .fontWeight(.bold)
                          .padding(.top, 20)
                      Text("Monitor crops, spray fields, and optimize yield — all with one easy-to-use drone.")
                          .foregroundColor(.white)
                          .font(.body)
                          .multilineTextAlignment(.center)
                          .padding(.horizontal)
                      
                      // Learn More button
                NavigationLink(destination: ProductDetailView(drone: drones[0])) {
                          Text("Learn More")
                              .font(.headline)
                              .foregroundColor(.white)
                              .padding()
                              .frame(maxWidth: .infinity)
                              .background(Color.green)
                              .cornerRadius(10)
                      }
                      .padding(.horizontal)
                      .padding(.top, 10)
                      
                      Spacer()
                  }
                  .padding(.top)
                  .background(Color(.black))
            
            
        }
      
}


#Preview {
    HomeView()
}
