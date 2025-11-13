//
//  GameView.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 13/11/25.
//

import SwiftUI

struct GameView: View {
    
    let game: Game
    let games: [Game]
    let platforms: [Platform]
    @Binding var path: NavigationPath
    
    var body: some View {
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

//#Preview {
//    GameView()
//}
