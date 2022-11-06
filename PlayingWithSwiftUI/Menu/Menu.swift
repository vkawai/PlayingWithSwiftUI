//
//  Menu.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import SwiftUI

struct MenuEntry: View {
    
    let entryName: String
    
    var body: some View {
        Text(entryName)
    }
}

struct Menu: View {
    
    @ObservedObject var controller: MenuController
    
    var body: some View {
        List(controller.viewModel.items, id: \.id) { item in
            NavigationLink(item.entryName) {
                AnyView(controller.view(for: item.id))
            }
            
        }.navigationTitle("Menu")
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Menu(controller: .init())
        }
    }
}
