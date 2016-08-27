//
//  AnimationThree.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/27.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class AnimationThree: UIViewController {
    
    @IBOutlet weak var imgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        //三点间的无限循环
//        let fly = CAKeyframeAnimation(keyPath: "position")
//        fly.duration = 2.0;
//        //无限重复
//        fly.repeatCount = MAXFLOAT
//        fly.values = [
//            NSValue(CGPoint:CGPoint(x: 50.0, y: 100.0)),
//            NSValue(CGPoint: CGPoint(x: view.frame.width - 50, y: 160)),
//            NSValue(CGPoint:CGPoint(x: 50.0, y: view.center.y)),
//            NSValue(CGPoint:CGPoint(x: 50.0, y: 100.0)),
//        ]
//        
//        fly.keyTimes = [0.0,0.33,0.66,1.0]
//        imgView.layer.addAnimation(fly, forKey: nil)
        
        //晃动
        let rotate = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotate.duration = 2.5
        rotate.repeatCount = MAXFLOAT
        rotate.values = [0.0,-M_PI_4/4,0.0,M_PI_4/4,0.0]
        rotate.keyTimes = [0.0,0.25,0.5,0.75,1.0]
        imgView.layer.addAnimation(rotate, forKey: nil)
        
        //CAShapeLayer 绘制图片
        let circle = CAShapeLayer()
        let mask = CAShapeLayer()
        
        circle.path = UIBezierPath(ovalInRect: imgView.bounds).CGPath
        circle.fillColor = UIColor.clearColor().CGColor
        mask.path = circle.path
        imgView.layer.mask = mask
        imgView.layer.addSublayer(circle)
        
    }
    

}
