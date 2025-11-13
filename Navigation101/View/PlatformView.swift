//
//  PlatformView.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 13/11/25.
//

import SwiftUI

struct PlatformView: View {
    
    let platform: Platform
    let games: [Game]
    
    var body: some View {
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
}

//#Preview {
//    PlatformView()
//}
