//
//  MainViewModel.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 13/11/25.
//

import SwiftUI
import Combine

extension MainView {
    @Observable
    class ViewModel {
        var platforms: [Platform] = [.init(name: "Xbox", imageName: "xbox.logo", color: .green),
                                     .init(name: "PlayStation", imageName: "playstation.logo", color: .indigo),
                                     .init(name: "PC", imageName: "pc", color: .pink),
                                     .init(name: "Mobile", imageName: "iphone", color: .mint)]
        
        var games: [Game] = [.init(name: "Minecraft", rating: "99"),
                             .init(name: "God of war", rating: "98"),
                             .init(name: "Fornite", rating: "92"),
                             .init(name: "Madden 2023", rating: "88")]
        
        var path = NavigationPath()
    }
}
