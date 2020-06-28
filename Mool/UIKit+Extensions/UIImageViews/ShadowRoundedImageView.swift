//
//  ShadowRoundedImageView.swift
//  Mool
//
//  Created by Alok Choudhary on 9/27/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

/// Rounded ImageView with configurable Shadow
open class ShadowRoundedImageView: UIView {
    
    @IBInspectable var image: UIImage? = nil {
        didSet {
            imageLayer.contents = image?.cgImage
            shadowLayer.shadowPath = (image == nil) ? nil : shapeAsPath }}
    
    var imageLayer: CALayer = CALayer()
    var shadowLayer: CALayer = CALayer()
    
    var shape: UIBezierPath {
        return UIBezierPath(roundedRect: bounds, cornerRadius:50) }
    
    var shapeAsPath: CGPath {
        return shape.cgPath }
    
    var shapeAsMask: CAShapeLayer {
        let s = CAShapeLayer()
        s.path = shapeAsPath
        return s }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = false
        backgroundColor = .clear
        
        self.layer.addSublayer(shadowLayer)
        self.layer.addSublayer(imageLayer) // (in that order)
        
        imageLayer.frame = bounds
        imageLayer.contentsGravity = .resizeAspectFill // (as preferred)
        
        imageLayer.mask = shapeAsMask
        shadowLayer.shadowPath = (image == nil) ? nil : shapeAsPath
        shadowLayer.shadowOpacity = 0.80 // etc ...
    }
}
