//
//  AnimationOne.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/26.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class AnimationOne: UIViewController {

    @IBOutlet weak var imgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        //加速，减速效果
//        UIView.animateWithDuration(2, delay: 0.2, options: [.Repeat,.Autoreverse,.CurveEaseInOut], animations: {
//            self.imgView.center.x += 150
//            }, completion: nil)
//        
//        //弹簧效果
//        UIView.animateWithDuration(2, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: { 
//            self.imgView.center.x += 150
//            }, completion: nil)
//        
//        //翻页效果  view是另外一个view替换
//        UIView.transitionWithView(view, duration: 2, options: [.TransitionCurlUp], animations: { 
//            self.view .addSubview(self.imgView)
//            }, completion: nil)
        
        
        //动画组
        // duration 整个动画的时间
        UIView.animateKeyframesWithDuration(5, delay: 0.0, options: [.CalculationModeCubic], animations: { () -> Void in
            
            // 1.第一步代码
            // frameStartTime 开始时间占总时间的百分比
            // relativeDuration 每一个小的动画占总时间的百分比
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.25) { () -> Void in
                self.imgView.center.y -= 10
                self.imgView.center.x += 180
            }
            
            // 2.第二步代码
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4, animations: { () -> Void in
                self.imgView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4)/2)
            })
            
            // 3.第三步代码
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.25, animations: { () -> Void in
                self.imgView.center.x += 180
                self.imgView.center.y -= 50
                self.imgView.alpha = 0.0
            })
            
            // 4.第四步代码
            UIView.addKeyframeWithRelativeStartTime(0.51, relativeDuration: 0.0, animations: { () -> Void in
                self.imgView.center.x = -50
            })
            
            // 5.第五步代码
            UIView.addKeyframeWithRelativeStartTime(0.51, relativeDuration: 0.1, animations: { () -> Void in
                self.imgView.center.y = self.view.center.y
                self.imgView.transform = CGAffineTransformIdentity
                self.imgView.alpha = 1.0
                
            })
            
            // 6.第六步代码
            UIView.addKeyframeWithRelativeStartTime(0.61, relativeDuration: 0.3, animations: { () -> Void in
                self.imgView.center.x = 100
            })
            
            }, completion: nil)
    }
    
}
