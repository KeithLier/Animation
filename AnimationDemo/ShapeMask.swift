//
//  ShapeMask.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/27.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

func delay(seconds seconds:Double,completion:()->()){
    
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds))
    
    dispatch_after(popTime,dispatch_get_main_queue()){
        completion()
    }
}

class ShapeMask: UIViewController {
    
    lazy var avatarLeft:AvatarView = {
        let avatarLeft = AvatarView()
        avatarLeft.frame = CGRect(x:self.view.frame.width - 110 , y: self.view.center.y, width: 90, height: 90)
        return avatarLeft
    }()
    
    lazy var avatarRight:AvatarView = {
        let avatarRight = AvatarView()
        avatarRight.frame = CGRect(x:20 , y: self.view.center.y, width: 90, height: 90)
        return avatarRight
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        avatarLeft.image = UIImage(named: "1.JPG")
        avatarLeft.label.text = "左边"
        avatarRight.image = UIImage(named: "1.JPG")
        avatarRight.label.text = "右边"
        
        view.addSubview(avatarLeft)
        view.addSubview(avatarRight)
        
        view.backgroundColor = UIColor.whiteColor()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let size = avatarLeft.frame.size
        
        let morphSize = CGSize(width: size.width * 0.85, height: size.height * 1.05)
        let offset:CGFloat = view.frame.size.width/2.0 - avatarLeft.lineWidth*2 - avatarLeft.frame.width
        avatarRight.boundsOffset(offset, morphSize: morphSize)
        avatarLeft.boundsOffset(avatarLeft.frame.origin.x - offset, morphSize: morphSize)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
