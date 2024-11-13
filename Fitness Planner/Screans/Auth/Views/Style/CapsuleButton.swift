//
//  CapsuleButton.swift
//  Fitness Planner
//
//  Created by Praveen Kumar on 06/11/24.
//

import SwiftUI

struct CapsuleButton: ButtonStyle{
    
    var bgColor: Color = .yelloButton
    var textColor: Color = .black
    var hasBorder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColor)
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.95: 1.0)
            .overlay {
                hasBorder ? Capsule().stroke(.white, lineWidth: 1) : nil
            }
    }
}
