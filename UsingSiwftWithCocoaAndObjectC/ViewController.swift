//
//  ViewController.swift
//  UsingSiwftWithCocoaAndObjectC
//
//  Created by Chuanxun on 16/2/17.
//  Copyright © 2016年 李亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    lazy var tableView:UITableView = {
        var tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuse_cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuse_cell")
        }
        
        cell?.textLabel?.text = "\(indexPath.row)"
        cell?.detailTextLabel?.text = "swift"
        
        return cell!
    }
}

