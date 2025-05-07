//
//  AppRootView.swift
//  DroneApp
//
//  Created by Safak Yaral on 6.05.2025.
//

import SwiftUI

struct AppRootView: View {
    @State private var showLaunchScreen = true

    var body: some View {
        Group {
            if showLaunchScreen {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                showLaunchScreen = false
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
struct LaunchScreen: View {
    var body: some View {
        ZStack {
            // Full-screen background image
            Image("launch2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea() // Ensures the image covers the whole screen

            // Overlay: loading bar (and any other content)
            VStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                    .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    AppRootView()
}
