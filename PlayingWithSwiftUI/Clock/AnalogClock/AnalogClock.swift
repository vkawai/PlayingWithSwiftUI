//
//  AnalogClock.swift
//  PlayingWithSwiftUI
//
//  Created by Vitor Kawai Sala on 23/10/22.
//

import SwiftUI

struct AnalogClock: View {
    
    @ObservedObject var controller: ClockController
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .overlay(
                    Circle().stroke(.black, lineWidth: 2)
                ).frame(width: 270)
            
            ForEach(0..<12) {
                let index = Double($0)
                let angle = Angle(radians: .pi * (index / 6))
                
                VStack {
                    Rectangle()
                        .frame(width: 4, height: 15)
                    
                    let hour = (Int(index) + 12) % 12
                    Text("\(hour > 0 ? hour : 12)")
                        .rotationEffect(-angle)
                        .offset(y: -5)

                }.offset(y: 112).rotationEffect(angle)
            }
            
            ForEach(0..<60) {
                let index = Double($0)
                VStack {
                    Rectangle().frame(width: 2, height: 10)
                }.offset(y: 95)
                .rotationEffect(Angle(radians: .pi * index / 30))
            }
            
            let tick = Angle(radians: .pi / 30)
            let secondsAngle = tick * Double(controller.viewModel.seconds)
            Rectangle()
                .frame(width: 1, height: 80)
                .offset(y: -40)
                .rotationEffect(secondsAngle)
            
            let minutesAngle = tick * Double(controller.viewModel.minutes)
            Rectangle()
                .frame(width: 3, height: 70)
                .offset(y: -35)
                .rotationEffect(minutesAngle)
            
            let hoursAngle = Angle(radians: .pi * Double(controller.viewModel.hour) / 6)
            Rectangle()
                .frame(width: 3, height: 60)
                .offset(y: -30)
                .foregroundColor(.red)
                .rotationEffect(hoursAngle)
            
            Circle()
                .frame(width: 5)
            
        }.onAppear { self.controller.start() }
            .onDisappear { self.controller.stop() }
    }
}

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClock(controller: .init(viewModel: .init(hour: 0, minutes: 0, seconds: 0)))
    }
}
