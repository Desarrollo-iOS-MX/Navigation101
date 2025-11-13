//
//  SimpleCardView.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 13/11/25.
//

import SwiftUI

struct SimpleCardView: View {
    
    let cardData: SimpleCard
    let cards: [SimpleCard]
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack(spacing: 25) {
            VStack {
                Text("\(cardData.title)")
                    .font(.title)
                Text("\(cardData.time)")
            }
            VStack {
                Image(systemName: "dog")
                    .font(.largeTitle)
                    .foregroundStyle(.brown)
                
                // En una subvista, no necesitamos agregar el navigation Link ni el NavigationStack, ya todo está en la vista principal.
                Button {
                    path.append(cards.randomElement()!)
                } label: {
                    Text("Practice")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(width: 150)
                        .padding(.vertical)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

//#Preview {
//    SimpleCardView()
//}
