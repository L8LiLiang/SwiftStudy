//
//  ViewController.swift
//  UsingSiwftWithCocoaAndObjectC
//
//  Created by Chuanxun on 16/2/17.
//  Copyright © 2016年 李亮. All rights reserved.
//

import UIKit
import CoreLocation


struct Venue {
    enum Category: String {
        case Entertainment
        case Food
        case Nightlife
        case Shopping
    }
    
    var name: String
    var coordinates: CLLocationCoordinate2D
    var category: Category
    
    
    init?(attributes: [String : AnyObject]) {
        guard let name = attributes["name"] as? String,
            let coordinates = attributes["coordinates"] as? [String: Double],
            let latitude = coordinates["lat"],
            let longitude = coordinates["lng"],
            let category = Category(rawValue: attributes["category"] as? String ?? "Invalid")
            else {
                return nil
        }
        
        self.name = name
        self.coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.category = category
    }
}


struct L8TestOption : OptionSetType {
    
    var rawValue:UInt
    
    static let TestOption1:L8TestOption = L8TestOption(rawValue:1 << 0)
    static let TestOption2:L8TestOption = L8TestOption(rawValue:1 << 1)
    static let TestOption3:L8TestOption = L8TestOption(rawValue:1 << 2)
    
}

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
        
        
        self.navigationItem.title = "UsingSwiftWithCocoaAndOC"
        
        let rightItem = UIBarButtonItem(title: "Test", style: UIBarButtonItemStyle.Plain, target: self, action: "test:")
        self.navigationItem.rightBarButtonItem = rightItem

    }

    func test(sender:AnyObject)->Void {
        let JSON = "{\"name\": \"Caffe Macs\",\"coordinates\": {\"lat\": 37.330576,\"lng\": -122.029739},\"category\": \"Food\"}"
        let data = JSON.dataUsingEncoding(NSUTF8StringEncoding)!
        let attributes = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]
        
        let venue = Venue(attributes: attributes)!
        print(venue.name)
        // prints "Caffe Macs"
        
        
        var options:L8TestOption = [.TestOption1,.TestOption2]
        options.insert(.TestOption3)
        if  options.contains(.TestOption1) {
            print("TestOption1")
        }
        if options.contains(.TestOption2) {
            print("TestOption2")
        }
        if options.contains(.TestOption3) {
            print("TestOption3")
        }
        
//        if os("iOS") {
//            print("iOS")
//        }else {
//            print("OSX")
//        }
        
        let image = UIImage(named: "logo58")
        image?.printSize()
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

