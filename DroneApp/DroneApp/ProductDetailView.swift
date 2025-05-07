//
//  ProductDetailView.swift
//  DroneApp
//
//  Created by Safak Yaral on 6.05.2025.
//

import SwiftUI

struct Drone: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String // You'll need to add images to your Assets
    let description: String
    let flightTime: String
    let range: String
    let sprayingCapacity: String
    let weight: String
}

// Place this outside of any struct
let drones: [Drone] = [
    Drone(
        name: "DJI Agras T40",
        imageName: "agras_t40",
        description: "40L tank, 12m spray width, 18-20 min flight time.",
        flightTime: "18-20 min",
        range: "12 m spray width",
        sprayingCapacity: "40 L",
        weight: "50kg",
        
    ),
    Drone(
        name: "XAG P100 Pro",
        imageName: "xag_p100",
        description: "40L tank, 10-12m spray width, 25 min flight time.",
        flightTime: "25 min",
        range: "10-12 m spray width",
        sprayingCapacity: "40 L",
        weight: "40kg",
        
    ),
    Drone(
        name: "Yamaha RMAX",
        imageName: "yamaha_rmax",
        description: "32L tank, 8m spray width, 45 min flight time.",
        flightTime: "45 min",
        range: "8 m spray width",
        sprayingCapacity: "32 L",
        weight: "45kg",
        
    ),
    Drone(
        name: "DJI Agras T20",
        imageName: "agras_t20",
        description: "20L tank, 7m spray width, 15-20 min flight time.",
        flightTime: "15-20 min",
        range: "7 m spray width",
        sprayingCapacity: "20 L",
        weight: "22kg",
       
    ),
    Drone(
        name: "XAG V40",
        imageName: "xag_v40",
        description: "16L tank, 6m spray width, 20 min flight time.",
        flightTime: "20 min",
        range: "6 m spray width",
        sprayingCapacity: "16 L",
        weight: "18kg",
        
    ),
    Drone(
        name: "Hylio AG-122",
        imageName: "hylio_ag122",
        description: "22L tank, 8m spray width, 25 min flight time.",
        flightTime: "25 min",
        range: "8 m spray width",
        sprayingCapacity: "22 L",
        weight: "25kg",
       
    ),
    Drone(
        name: "TTA M6E-X",
        imageName: "tta_m6ex",
        description: "10L tank, 4m spray width, 18 min flight time.",
        flightTime: "18 min",
        range: "4 m spray width",
        sprayingCapacity: "10 L",
        weight: "12kg",
        
    ),
    Drone(
        name: "Kray Technologies Kray Pro",
        imageName: "kray_pro",
        description: "16L tank, 12m spray width, 30 min flight time.",
        flightTime: "30 min",
        range: "12 m spray width",
        sprayingCapacity: "16 L",
        weight: "18kg",
        
    ),
    Drone(
        name: "DroneVolt Hercules 20",
        imageName: "hercules_20",
        description: "25L tank, 10m spray width, 30 min flight time.",
        flightTime: "30 min",
        range: "10 m spray width",
        sprayingCapacity: "25 L",
        weight: "40kg",
        
    ),
    Drone(
        name: "Guardian Agriculture SC1",
        imageName: "guardian_sc1",
        description: "90.7L tank, fully autonomous, eVTOL.",
        flightTime: "Not specified",
        range: "Not specified",
        sprayingCapacity: "90.7 L",
        weight: "90kg",
       
    )
]

struct ProductDetailView: View {
    let drone: Drone

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Image(drone.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                    .shadow(radius: 4)

                Text(drone.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(drone.description)
                    .font(.body)
                    .foregroundColor(.secondary)

                Divider().padding(.vertical)

                // Technical specifications list
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("📈 Flight Time:")
                        Spacer()
                        Text(drone.flightTime)
                    }
                    HStack {
                        Text("🎯 Range:")
                        Spacer()
                        Text(drone.range)
                    }
                    HStack {
                        Text("💧 Spraying Capacity:")
                        Spacer()
                        Text(drone.sprayingCapacity)
                    }
                    HStack {
                        Text("⚖️ Weight:")
                        Spacer()
                        Text(drone.weight)
                    }
                }
                .font(.body)

                Divider().padding(.vertical)

                // Purchase button
                NavigationLink(destination: PricingView()) {
                    Text("Buy Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.vertical)

                // Other Drones section
                Text("Other Drones")
                    .font(.headline)
                    .padding(.top, 24)

                ForEach(Array(drones.enumerated()), id: \.element.id) { (index, otherDrone) in
                    if otherDrone.id != drone.id {
                        NavigationLink(destination: ProductDetailView(drone: otherDrone)) {
                            HStack {
                                Text("\(index + 1).")
                                    .font(.title3)
                                    .foregroundColor(.green)
                                    .frame(width: 30)
                                Image(otherDrone.imageName)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(6)
                                Text(otherDrone.name)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(Color(.systemBackground))
        .navigationTitle(drone.name)
    }
}

#Preview {
    ProductDetailView(drone: drones[0])
}


