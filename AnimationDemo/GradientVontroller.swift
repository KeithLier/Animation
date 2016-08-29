//
//  GradientVontroller.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/29.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class GradientVontroller: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        let label = GradientLabel()
        label.center = view.center
        label.bounds = CGRect(x: 0, y: 0, width: 239, height: 44)
        label.text = "> 滑动来解锁"
        view.addSubview(label)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
