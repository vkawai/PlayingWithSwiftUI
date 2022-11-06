//
//  SimpleLoading.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 24/10/22.
//

import Combine
import SwiftUI

struct Arc: Shape {
    
    var startAngle: Double
    var endAngle: Double
    let clockwise: Bool
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle, endAngle) }
        set {
            startAngle = newValue.first
            endAngle = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(
            center: .init(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: .degrees(endAngle) - .degrees(90),
            endAngle: .degrees(startAngle) - .degrees(90),
            clockwise: clockwise
        )
        return path
    }
}

struct SimpleLoading: View {
    
    @State private var animationIndex = 0
    @State private var startAngle: Double = 0
    @State private var endAngle: Double = 0
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common)
    @State private var subscriber: Cancellable?
    
    var body: some View {
        ZStack {
            Arc(startAngle: startAngle, endAngle: endAngle, clockwise: true)
                .stroke(lineWidth: 10)
                .frame(width: 100)
                .onReceive(timer) { time in
                    withAnimation(.easeInOut(duration: 2)) {
                        updateAngles(for: animationIndex)
                    }
                    animationIndex = (animationIndex + 1) % 2
                    if animationIndex == 0 {
                        startAngle = 0
                        endAngle = 0
                    }
                }.onAppear {
                    subscriber = timer.connect()
                }.onDisappear {
                    subscriber?.cancel()
                }
        }
    }
    
    private func updateAngles(for animationIndex: Int) {
        switch animationIndex {
        case 0:
            startAngle = 0
            endAngle = 360
        case 1:
            startAngle = 360
            endAngle = 360
        default:
            break
        }
    }
}

struct SimpleLoading_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SimpleLoading()
        }
    }
}
