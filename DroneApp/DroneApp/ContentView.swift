//
//  ContentView.swift
//  DroneApp
//
//  Created by Safak Yaral on 6.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showHome = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Image("drone3")
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(8)
                        .shadow(radius: 4)
                   
                    Text("DIGITAL AGRICULTURE")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                        
                        
                        Text("AXI digital agricultural solutions in the operation of precision farming drones.")
                        .foregroundColor(.white)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        
                    
                    Spacer()
                    // Right arrow button only
                    Button(action: {
                        showHome = true
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.green)
                            .padding()
                    }
                    // NavigationLink for programmatic navigation
                    NavigationLink(destination: HomeView(), isActive: $showHome) {
                        EmptyView()
                    }
                }
                .padding()
            }
        }
    }
}



#Preview {
    ContentView()
}
