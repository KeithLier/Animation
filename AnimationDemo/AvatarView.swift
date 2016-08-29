//
//  AvatarView.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/27.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    let lineWidth:CGFloat = 6.0
    let animationDuration = 1.0
    var isSquare = false

    let photoLayer = CALayer()
    let circleLayer = CAShapeLayer()
    let maskLayer = CAShapeLayer()
    
    let label:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(18.0)
        label.textAlignment = .Center
        label.textColor = UIColor.blackColor()
        return label
    }()
    
    @IBInspectable
    var image:UIImage!{
        didSet{
            photoLayer.contents = image.CGImage
        }
    }
    
    override func didMoveToWindow() {
        
        layer.addSublayer(photoLayer)
        photoLayer.mask = maskLayer
        layer.addSublayer(circleLayer)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        photoLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        circleLayer.path = UIBezierPath(ovalInRect: bounds).CGPath
        circleLayer.strokeColor = UIColor.whiteColor().CGColor
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = UIColor.clearColor().CGColor
        maskLayer.path = circleLayer.path
        maskLayer.position = CGPoint(x: 0.0, y: 0.0)
        
        label.frame = CGRect(x: 0, y: bounds.size.height + 10, width: bounds.size.width, height:24)
    }
    
    func boundsOffset(boundsOffset:CGFloat,morphSize:CGSize){
        layoutSubviews()
        let originalCenter = center
        //前进
        UIView.animateWithDuration(animationDuration, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: [], animations: {
            
            self.frame.origin.x = boundsOffset
            
            }) { (_) in
                self.animationToSquare()
        }
        
        //后退
        UIView.animateWithDuration(animationDuration, delay: animationDuration, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: [], animations: {
            
            self.center = originalCenter
            
            }) { (_) in
                if !self.isSquare{
                    self.boundsOffset(boundsOffset, morphSize: morphSize)
                }
        }
        
        //碰撞效果
        let morphFrame = (originalCenter.x > boundsOffset) ?
        CGRect(x: 0.0, y: bounds.height - morphSize.height, width: morphSize.width, height: morphSize.height) :
        CGRect(x: bounds.width - morphSize.width, y: bounds.height - morphSize.height, width: morphSize.width, height: morphSize.height)
        
        let morphAnimation = CABasicAnimation(keyPath: "path")
        morphAnimation.duration = animationDuration
        morphAnimation.toValue = UIBezierPath(ovalInRect: morphFrame).CGPath
        morphAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        circleLayer.addAnimation(morphAnimation, forKey: nil)
        maskLayer.addAnimation(morphAnimation, forKey: nil)
        
    }
    
    func animationToSquare(){
        
        isSquare = true
        
        let path = UIBezierPath(rect:bounds).CGPath
        let morph = CABasicAnimation(keyPath: "path")
        morph.duration = 0.25
        morph.fromValue = circleLayer.path
        morph.toValue = path
        
        circleLayer.addAnimation(morph, forKey: nil)
        maskLayer.addAnimation(morph, forKey: nil)
        
        circleLayer.path = path
        maskLayer.path = path
    }
}
