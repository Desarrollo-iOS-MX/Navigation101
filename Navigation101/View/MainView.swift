//
//  MainView.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 13/11/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List {
                Section("Platforms") {
                    ForEach(viewModel.platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                
                Section("Games") {
                    ForEach(viewModel.games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                            Text(game.rating)
                        }
                    }
                }
            }
            .navigationTitle("Gamming")
            .navigationDestination(for: Platform.self) { platform in
                PlatformView(platform: platform, games: viewModel.games)
            }
            .navigationDestination(for: Game.self) { game in
                GameView(game: game, games: viewModel.games, platforms: viewModel.platforms, path: $viewModel.path)
            }
        }
    }
}

#Preview {
    MainView()
}
