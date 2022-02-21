//
//  Shake.swift
//  Wordle
//
//  Created by Silvia España on 18/2/22.
//

import SwiftUI

// https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/

struct Shake: GeometryEffect {
    
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

    
