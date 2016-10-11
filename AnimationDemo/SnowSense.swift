//
//  SnowSense.swift
//  AnimationDemo
//
//  Created by Keith on 16/9/11.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class SnowSense: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.snow()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func snow(){
        let emitter = CAEmitterLayer()
        let rect = view.bounds
        emitter.backgroundColor = UIColor.blackColor().CGColor
        emitter.frame = rect
        view.layer.addSublayer(emitter)

        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterPosition = CGPoint(x: rect.width/2, y: 0)
        emitter.emitterSize = rect.size

        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "flake3")?.CGImage
        
        emitterCell.birthRate = 250
        emitter.emitterCells = [emitterCell]
        
        emitterCell.yAcceleration = 70.0
        emitterCell.xAcceleration = 10.0
        
        emitterCell.emissionLatitude = CGFloat(-M_PI)
        
        emitterCell.velocityRange = 200.0
        emitterCell.emissionRange = CGFloat(M_PI_2)
        emitterCell.lifetimeRange = 18
        
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3
        
        emitterCell.scaleRange = 0.8
        
        emitterCell.scaleSpeed = -0.05
        
        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15
    }
}
