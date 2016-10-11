//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Keith on 16/8/26.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    var animations:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "动画演示"
        self.view.backgroundColor = UIColor().redColor()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "animation")
        animations = ["动画1","动画2","动画3","ShapeMask","CAGradientLayer","Refresh","Replicator","SnowSense"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animations.count;
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("animation", forIndexPath: indexPath) as UITableViewCell
        let text = animations[indexPath.row] as? String
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {
            let one = AnimationOne()
            navigationController?.pushViewController(one, animated: true)
        }
        if indexPath.row == 1 {
            let two = AnimationTwo()
            navigationController?.pushViewController(two, animated: true)
        }
        if indexPath.row == 2 {
            let three = AnimationThree()
            navigationController?.pushViewController(three, animated: true)
        }
        if indexPath.row == 3 {
            let mask = ShapeMask()
            navigationController?.pushViewController(mask, animated: true)
        }
        if indexPath.row == 4 {
            let gra = GradientVontroller()
            navigationController?.pushViewController(gra, animated: true)
        }
        if indexPath.row == 5 {
            let refresh = RefreshController()
            navigationController?.pushViewController(refresh, animated: true)
        }
        if indexPath.row == 6 {
            let rep = ReplicatorController()
            navigationController?.pushViewController(rep, animated: true)
        }
        if indexPath.row == 7 {
            let snow = SnowSense()
            navigationController?.pushViewController(snow, animated: true)
        }
    }
}

