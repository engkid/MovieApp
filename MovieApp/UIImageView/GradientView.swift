//
//  GradientView.swift
//  MovieApp
//
//  Created by k1d_dev on 13/08/23.
//

import UIKit

class GradientImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        // Set gradient colors
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        
        // Set gradient start and end points
        gradientLayer.startPoint = CGPoint(x: 0.8, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        
        // Add the gradient layer as a sublayer
        layer.addSublayer(gradientLayer)
        layer.opacity = 0.8
    }
}
