//
//  ContentView.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    
    var platforms: [Platform] = [.init(name: "Xbox", imageName: "xbox.logo", color: .green),
                                 .init(name: "PlayStation", imageName: "playstation.logo", color: .indigo),
                                 .init(name: "PC", imageName: "pc", color: .pink),
                                 .init(name: "Mobile", imageName: "iphone", color: .mint)]
    
    var games: [Game] = [.init(name: "Minecraft", rating: "99"),
                         .init(name: "God of war", rating: "98"),
                         .init(name: "Fornite", rating: "92"),
                         .init(name: "Madden 2023", rating: "88")]
    
    @State private var path = NavigationPath()
                                 
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                            Text(game.rating)
                        }
                    }
                }
            }
            .navigationTitle("Gamming")
            .navigationDestination(for: Platform.self) { platform in
                // Platform UI
                ZStack {
                    platform.color.ignoresSafeArea()
                    VStack {
                        Label(platform.name, systemImage: platform.imageName)
                            .font(.largeTitle).bold()
                        
                        List {
                            ForEach(games, id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                    Text(game.rating)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                // Games UI
                VStack(spacing: 20) {
                    Text(game.name)
                        .font(.largeTitle).bold()
                    Text(game.rating)
                        .foregroundStyle(.secondary)
                    
                    Button {
                        path.append(games.randomElement()!)
                    } label: {
                        Text("Recommended game")
                    }
                    
                    Button {
                        path.append(platforms.randomElement()!)
                    } label: {
                        Text("Go to another platform")
                    }
                    
                    Button {
                        path = NavigationPath()
                    } label: {
                        Text("Go home")
                    }
                }
            }
        }
    }
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}

#Preview {
    ContentView()
}
