//
//  other.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/2/3.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

func testPerformSelector(){
    
    let string: NSString = "Hello, Cocoa!"
    let selector: Selector = "lowercaseString"
    if let result = string.performSelector(selector) {
        print(result.takeUnretainedValue())
    }
    
}