//
//  GradientLabel.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/29.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class GradientLabel: UIView {

    lazy var gradientLayer : CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let colors = [
            UIColor.blackColor().CGColor,
            UIColor.whiteColor().CGColor,
            UIColor.blackColor().CGColor
        ]
        gradientLayer.colors = colors
        
        let locations = [0.25,0.5,0.75]
        gradientLayer.locations = locations
        
        return gradientLayer;
    }()
    
    
    lazy var textAttributes:[String: AnyObject] = {
        let style = NSMutableParagraphStyle()
        style.alignment = .Center
        
        return [
            NSFontAttributeName:UIFont(name: "HelveticaNeue-Thin", size: 28.0)!,
            NSParagraphStyleAttributeName:style
        ]
    }()
    
    @IBInspectable var text:String!{
        didSet{
            setNeedsDisplay()
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            text.drawInRect(bounds, withAttributes: textAttributes)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.clearColor().CGColor
            maskLayer.frame = CGRectOffset(bounds, bounds.size.width, 0)
            maskLayer.contents = image.CGImage
            
            gradientLayer.mask = maskLayer
        }
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = CGRect(x: -bounds.size.width, y: bounds.size.height, width: 3*bounds.size.width, height:  bounds.size.height)
        layer.addSublayer(gradientLayer)
    }
    
    override func didMoveToWindow() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0,0.0,0.25]
        animation.toValue = [0.75,1.0,1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        gradientLayer.addAnimation(animation, forKey: nil)
    }
    
}
