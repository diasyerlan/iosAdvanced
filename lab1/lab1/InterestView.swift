//
//  InterestView.swift
//  lab1
//
//  Created by Dias Yerlan on 22.02.2025.
//

import SwiftUI

struct Hobby: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let icon: String
}

struct InterestView: View {
    let hobbies = [
        Hobby(name: "Photography", description: "Capturing moments through the lens.", icon: "camera"),
        Hobby(name: "Cycling", description: "Exploring the outdoors on two wheels.", icon: "bicycle"),
        Hobby(name: "Cooking", description: "Experimenting with new recipes.", icon: "fork.knife"),
        Hobby(name: "Photography", description: "Capturing moments through the lens.", icon: "camera"),
        Hobby(name: "Cycling", description: "Exploring the outdoors on two wheels.", icon: "bicycle"),
        Hobby(name: "Cooking", description: "Experimenting with new recipes.", icon: "fork.knife"),
        Hobby(name: "Reading", description: "Diving into different worlds through books.", icon: "book"),
        Hobby(name: "Gardening", description: "Nurturing plants and enjoying nature.", icon: "leaf"),
        Hobby(name: "Hiking", description: "Exploring trails and embracing the outdoors.", icon: "figure.walk"),
        Hobby(name: "Painting", description: "Expressing creativity with colors and brushes.", icon: "paintbrush"),
        Hobby(name: "Gaming", description: "Enjoying immersive virtual worlds.", icon: "gamecontroller"),
        Hobby(name: "Music", description: "Listening to and creating melodies.", icon: "music.note"),
        
    ]
    
    @State private var tappedHobbyID: UUID? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.indigo.opacity(0.4), .orange.opacity(0.5)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            List(hobbies) { hobby in
                HStack(spacing: 16) {
                    Image(systemName: hobby.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                        .scaleEffect(tappedHobbyID == hobby.id ? 1.3 : 1.0)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 5), value: tappedHobbyID)
                        .onTapGesture {
                            tappedHobbyID = hobby.id
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                tappedHobbyID = nil
                            }
                        }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(hobby.name)
                            .font(.headline)
                        Text(hobby.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Interests and hobbies")

        }
        
        
    }
}

#Preview {
    InterestView()
    
}
