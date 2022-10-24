//
//  MenuController.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import Foundation

struct MenuViewModel {
    
    struct ItemViewModel: Identifiable {
        var id: Int
        var entryName: String
    }
    
    var items: [ItemViewModel]
}

final class MenuController: ObservableObject {
    @Published var viewModel: MenuViewModel = .init(items: [
        .init(id: 0, entryName: "Digital Clock"),
        .init(id: 1, entryName: "Analog Clock")
    ])
}
