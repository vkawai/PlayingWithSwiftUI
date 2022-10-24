//
//  PlayingWithSwiftUIApp.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import SwiftUI

@main
struct PlayingWithSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Menu(controller: .init())
            }
        }
    }
}
