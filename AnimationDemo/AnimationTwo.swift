//
//  AnimationTwo.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/27.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class AnimationTwo: UIViewController {

    @IBOutlet weak var imgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let fly = CABasicAnimation(keyPath: "position.x")
//        //设置代理，监听动画开始喝结束
//        fly.delegate = self
//        //设置名称，
//        fly.setValue("form", forKey: "name")
//        //方便代理可以拿到layer
//        fly.setValue(imgView.layer, forKey: "layer")
//        fly.removedOnCompletion = false
//        /**
//         kCAFillModeRemoved : 默认样式 动画结束后会回到layer的开始的状态
//         kCAFillModeForwards : 动画结束后,layer会保持结束状态
//         kCAFillModeBackwards : layer跳到fromValue的值处,然后从fromValue到toValue播放动画,最后回到layer的开始的状态
//         kCAFillModeBoth : kCAFillModeForwards和kCAFillModeBackwards的结合,即动画结束后layer保持在结束状态
//        */
//        fly.fillMode = kCAFillModeBoth
//
//        fly.fromValue = 30
//        fly.toValue = 300
//        fly.duration = 1
//        fly.beginTime = CACurrentMediaTime() + 0.5
//        imgView.layer.addAnimation(fly, forKey: nil)
//        
//        
//        //移除动画
//        imgView.layer.removeAnimationForKey("position.x")
//        
//        imgView.layer.removeAllAnimations()
        
        
//        //动画组
//        let group = CAAnimationGroup()
//        //延迟1秒
//        group.beginTime = CACurrentMediaTime() + 1
//        //动画持续3秒
//        group.duration = 3
//        
//        
//        group.removedOnCompletion = false
//        group.fillMode = kCAFillModeBoth
//        
//        //缓慢加速  缓慢减速
//        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        //重复次数
//        group.repeatCount = 4.5
//        //来回执行
//        group.autoreverses = true
//        //速度
//        group.speed = 2;
//        
//        let scale = CABasicAnimation(keyPath: "transform.scale")
//        scale.fromValue = 1.5
//        scale.toValue = 1
//        
//        let rotate = CABasicAnimation(keyPath: "transform.rotation")
//        rotate.fromValue = CGFloat(M_PI_4)
//        rotate.toValue = 0.0
//        
//        let fade = CABasicAnimation(keyPath: "opacity")
//        fade.fromValue = 0.5
//        fade.toValue = 1
//        
//        group.animations = [scale,rotate,fade]
//        imgView.layer.addAnimation(group, forKey: nil)
     
        /**
         Layer的弹簧效果  CASpringAnimation
         
         CASpringAnimation的重要属性:
         
         mass：质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
         stiffness：弹性系数（弹性系数越大，弹簧的运动越快）
         damping：阻尼系数（阻尼系数越大，弹簧的停止越快)
         initialVelocity：初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
         settlingDuration：结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置）
        */
        
        let spring = CASpringAnimation(keyPath: "transform.scale")
        spring.fromValue = 1.5
        spring.toValue = 1.0
        
        spring.duration = spring.settlingDuration
        spring.mass = 10.0
        spring.stiffness  = 1500.0
        spring.damping = 50
        spring.initialVelocity = 100
        
        imgView.layer.addAnimation(spring, forKey: nil)
        
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("start...")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("stop...")
        let name = anim.valueForKey("name") as? String
        if name == "form" {
            let layer = anim.valueForKey("layer") as? CALayer
            anim .setValue(nil, forKey: "layer")
            
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.fromValue = 1.5
            pulse.toValue = 1
            pulse.duration = 1.75
            layer?.addAnimation(pulse, forKey: nil)
        }
    }

}

