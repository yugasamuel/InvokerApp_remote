//
//  CAGradientLayer+Spell.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = [UIColor(resource: .invokerBackgroundBegin).cgColor, UIColor(resource: .invokerBackgroundEnd).cgColor]
        layer.frame = frame
        return layer
    }
}

