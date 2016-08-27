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
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "animation")
        animations = ["动画1","动画2","动画3","动画4","动画5"]
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
    }
}

