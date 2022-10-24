//
//  ClockController.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import Foundation
import Combine
import SwiftUI

struct ClockViewModel {
    var hour: Int
    var minutes: Int
    var seconds: Int
}

final class ClockController: ObservableObject {
    
    @Published var viewModel: ClockViewModel
    
    private var subscription: Cancellable?
    
    init(viewModel: ClockViewModel = .init(hour: 0, minutes: 0, seconds: 0)) {
        self.viewModel = viewModel
    }
    
    func start() {
        subscription = Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .map { date in
                let hour = Calendar(identifier: .gregorian).component(.hour, from: date)
                let minutes = Calendar(identifier: .gregorian).component(.minute, from: date)
                let seconds = Calendar(identifier: .gregorian).component(.second, from: date)
                return ClockViewModel(hour: hour, minutes: minutes, seconds: seconds)
            }.assign(to: \.viewModel, on: self)
    }
    
    func stop() {
        subscription?.cancel()
    }
}
