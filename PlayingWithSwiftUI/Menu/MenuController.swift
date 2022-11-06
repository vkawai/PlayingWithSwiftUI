//
//  MenuController.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import Foundation
import SwiftUI

struct MenuViewModel {
    
    enum ItemIdentifier {
        case digitalClock
        case analogClock
        case simpleLoading
    }
    
    struct ItemViewModel: Identifiable {
        var id: ItemIdentifier
        var entryName: String
    }
    
    var items: [ItemViewModel]
}

final class MenuController: ObservableObject {
    
    @Published var viewModel: MenuViewModel = .init(items: [
        .init(id: .digitalClock, entryName: "Digital Clock"),
        .init(id: .analogClock, entryName: "Analog Clock"),
        .init(id: .simpleLoading, entryName: "Simple Loading")
    ])
    
    @ViewBuilder
    func view(for id: MenuViewModel.ItemIdentifier) -> some View {
        switch id {
        case .digitalClock:
            DigitalClock(controller: .init())
        case .analogClock:
            AnalogClock(controller: .init())
        case .simpleLoading:
            SimpleLoading()
        }
    }
}
