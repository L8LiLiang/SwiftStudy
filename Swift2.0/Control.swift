//
//  Control.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

/*
//强大的switch
var testNum = 10

switch testNum {
case 1:
print("one")
case 2...9:
print("two...nine")
case 10,11,12:
print("ten,eleven,twele")
fallthrough//贯穿，swift的switch不需要break，默认不继续执行，如果想继续执行，使用fallthrough
default:
print("unknown")
}

let somePoint = (0,2)
switch somePoint {
case (0,0):
print("original")
case (_,0):
print("x")
case (0,var y):
print("\(y)")
default:
print("somepoint")
}

switch somePoint {
case let(x,y) where x == y:
print("x=y")
case let(x,y) where x == -y:
print("x=-y")
case let(x,y):
print("\(x,y)")
}


//给语句使用标签，break 和 continue时指定标签

var x = 10;
gameLoop: while x < 20 {
switch x + 1 {
case 14:
print("14")
x += 1
case 16:
x += 2
break gameLoop
default:
x += 1
}
}

//guard

func greet(person:[String:String])->Void {
guard let name = person["name"] else {
return
}

print("nice to meet you \(name)")

guard let location = person["location"] else {
print("I hope the weather is nice near you")
return
}

print("I hope the location is nice in \(location)")
}

greet(["name":"Leon"])
greet(["name":"Leon","location":"BeiJing"])

//检测API可用性
if #available(iOS 9, OSX 10.10, *) {
// 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
// 使用先前版本的 iOS 和 OS X 的 API
}
//以上可用性条件指定了在 iOS 系统上，if段的代码仅会在 iOS 9 及更高版本的系统上执行；在 OS X，仅会在 OS X v10.10 及更高版本的系统上执行。最后一个参数，*，是必须写的，用于处理未来潜在的平台。


*/