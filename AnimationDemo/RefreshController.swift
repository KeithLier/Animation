//
//  RefreshController.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/30.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

func refreshDelay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

let refreshViewHeight : CGFloat = 110.0

class RefreshController: UIViewController,RefreshViewDelegate,UITableViewDelegate,UITableViewDataSource {

    var refreshView : RefreshView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        let rect = CGRect(x: 0.0, y: -refreshViewHeight, width: view.frame.width, height: refreshViewHeight)
        refreshView = RefreshView(frame: rect, scrollView: tableView)
        refreshView!.delegate = self
        tableView.addSubview(refreshView!)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        cell!.textLabel!.text = String("这是第\(indexPath.row+1)个cell")
        return cell!
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        refreshView?.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        refreshView?.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    func refreshViewDidRefresh(refreshView: RefreshView) {
        refreshDelay(seconds: 4) {
            refreshView.endRefreshing()
        }
    }
}
