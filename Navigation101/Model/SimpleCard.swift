//
//  SimpleCard.swift
//  Navigation101
//
//  Created by José Miguel Torres Chávez Nava on 13/11/25.
//

import Foundation

struct SimpleCard: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var time: Int
}
