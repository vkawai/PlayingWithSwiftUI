//
//  DigitalClock.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import SwiftUI

struct DigitalClock: View {
    
    @ObservedObject var controller: ClockController
    
    var body: some View {
        
        HStack(spacing: 2) {
            Text(String(format: "%02d", controller.viewModel.hour))
            Text(":")
            Text(String(format: "%02d", controller.viewModel.minutes))
            Text(":")
            Text(String(format: "%02d", controller.viewModel.seconds))
        }.onAppear { controller.start() }
            .onDisappear { controller.stop() }
            .navigationTitle("Digital Clock")
            
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DigitalClock(controller: .init())
        }
    }
}
