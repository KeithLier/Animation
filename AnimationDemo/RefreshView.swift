//
//  RefreshView.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/30.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

protocol RefreshViewDelegate {
    func refreshViewDidRefresh(refreshView:RefreshView)
}

class RefreshView: UIView,UIScrollViewDelegate {
    var delegate : RefreshViewDelegate?
    var scrollView : UIScrollView?
    var progress:CGFloat = 0.0
    var refreshing:Bool = false
    var isRefreshing = false
    
    let ovalLayer:CAShapeLayer = CAShapeLayer()
    let airplaneLayer:CALayer = CALayer()
    
    init(frame:CGRect, scrollView:UIScrollView){
        super.init(frame: frame)
        
        self.scrollView = scrollView
        backgroundColor = UIColor(red: 0, green: 155/255.0, blue: 226/255.0, alpha: 1)
        
        //白色的圆圈
        ovalLayer.strokeColor = UIColor.whiteColor().CGColor
        ovalLayer.fillColor = UIColor.clearColor().CGColor
        ovalLayer.lineWidth = 4.0
        ovalLayer.lineDashPattern = [2,3]
        let radius = frame.size.height / 2 * 0.8
        ovalLayer.path = UIBezierPath(ovalInRect: CGRect(x: frame.size.width/2 - radius, y: frame.size.height/2 - radius, width: 2*radius, height: 2*radius)).CGPath
        layer.addSublayer(ovalLayer)
        
        //添加图片
        let airplane = UIImage(named: "icon-plane")
        airplaneLayer.contents = airplane?.CGImage
        airplaneLayer.bounds = CGRect(x: 0, y: 0, width: airplane!.size.width, height: airplane!.size.height)
        airplaneLayer.position = CGPoint(x: frame.size.width/2 + frame.size.height/2*0.8, y: frame.size.height/2)
        layer.addSublayer(airplaneLayer)
        airplaneLayer.opacity = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = CGFloat(max(-(scrollView.contentOffset.y + scrollView.contentInset.top), 0.0))
        self.progress = min(max(offsetY / frame.size.height, 0.0), 1.0)
        if !refreshing {
            redrawFromProgress(progress)
        }
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if !refreshing && self.progress >= 1.0 {
            delegate?.refreshViewDidRefresh(self)
            beginRefreshing()
        }
    }
    
    
    //开始刷新
    func beginRefreshing(){
        isRefreshing = true
        UIView.animateWithDuration(0.3) { 
            var inset = self.scrollView!.contentInset
            inset.top += self.frame.size.height
            self.scrollView!.contentInset = inset
        }
        
        let start = CABasicAnimation(keyPath: "strokeStart")
        start.fromValue = -0.5
        start.toValue = 1.0
        
        let end = CABasicAnimation(keyPath: "strokeEnd")
        end.fromValue = 0.0
        end.toValue = 1.0
        
        let group = CAAnimationGroup()
        group.duration = 1.5
        group.repeatDuration = 5.0
        group.animations = [start,end];
        
        let fly = CAKeyframeAnimation(keyPath: "position")
        fly.path = ovalLayer.path
        fly.calculationMode = kCAAnimationPaced
        
        let airplane = CABasicAnimation(keyPath:"transform.roration")
        airplane.fromValue = 0
        airplane.toValue = 2 * M_PI
        
        let flyGroup = CAAnimationGroup()
        flyGroup.duration = 1.5
        flyGroup.repeatDuration = 5.0
        flyGroup.animations = [fly,airplane]
        airplaneLayer.addAnimation(flyGroup, forKey: nil)
    }
    
    //结束刷新
    func endRefreshing(){
        isRefreshing = false
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseOut, animations: { 
            var inset = self.scrollView!.contentInset
            inset.top -= self.frame.size.height
            self.scrollView!.contentInset = inset
            }, completion: nil)
    }
    
    func redrawFromProgress(progress: CGFloat) {
        ovalLayer.strokeEnd = progress
        airplaneLayer.opacity = 1
    }
}
