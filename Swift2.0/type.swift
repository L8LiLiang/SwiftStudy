//
//  type.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/1/27.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}

@available(iOS 9.0, OSX 10.12, *)
func testType2(){
    let someInstance: SomeBaseClass = SomeSubClass()
    // someInstance 在编译期是 SomeBaseClass 类型，
    // 但是在运行期则是 SomeSubClass 类型
    someInstance.dynamicType.printClassName()
    // 打印 “SomeSubClass”
}

func testType(){
    let someInstance: SomeBaseClass = SomeSubClass()
    // someInstance 在编译期是 SomeBaseClass 类型，
    // 但是在运行期则是 SomeSubClass 类型
    someInstance.dynamicType.printClassName()
    // 打印 “SomeSubClass”
}


//@objc 该特性用于修饰任何可以在 Objective-C 中表示的声明。比如，非嵌套类、协议、非泛型枚举（仅限原始值为整型的枚举）、类和协议中的属性和方法（包括存取方法）、构造器、析构器以及下标。objc 特性告诉编译器这个声明可以在 Objective-C 代码中使用。

@objc
class ExampleClass: NSObject {
    var enabled: Bool {
        @objc(isEnabled) get {
            // 返回适当的值
            return true
        }
    }
}



func testPattern(){
    let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
    // 只匹配非 nil 的元素
    for case let number? in arrayOfOptionalInts {
        print("Found a \(number)")
    }
    
    let arrayOfInts = [1,7,9]
    for number in arrayOfInts {
        print("this \(number)")
    }
}





