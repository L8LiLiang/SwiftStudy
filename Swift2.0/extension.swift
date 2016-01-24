//
//  extension.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/24.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

/*
Swift 中的扩展可以：

添加计算型属性和计算型类型属性
定义实例方法和类型方法
提供新的构造器
定义下标
定义和使用新的嵌套类型
使一个已有类型符合某个协议
*/

//扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。


extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

func extensionTest1(){
    
    let oneInch = 25.4.mm
    print("One inch is \(oneInch) meters")
}



//扩展能为类添加新的便利构造器，但是它们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供。















