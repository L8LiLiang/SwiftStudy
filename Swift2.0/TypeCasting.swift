//
//  TypeCasting.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/24.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation


class C111 {
    var name:String
    init(name:String){
        self.name = name
    }
}

class C222:C111 {
    var age:Int
    init(name:String,age:Int){
        self.age = age
        super.init(name: name)
    }
}

class C333:C111 {
    var sex:Bool
    init(name:String,sex:Bool){
        self.sex = sex
        super.init(name: name)
    }
}



func testTypeCasting(){
    let ccc = [
        C222(name: "Leon", age: 31),
        C222 (name: "Lampard", age: 37),
        C333(name: "Drogba", sex: true)
    ]
    
    for ppp in ccc {
        if ppp is C222 {
            let tmp = ppp as! C222
            print(tmp.age)
        }else if ppp is C333 {
            let tmp = ppp as! C333
            print(tmp.sex)
        }
    }
}


// Any 表示任何类型的对象、变量； AnyObject 表示任何｀类｀类型的对象

//在switch中使用as进行细分
func testAny(){
    
    var things = [Any]()
    things.append(0)
    things.append(0.0)
    things.append(42)
    things.append(3.14159)
    things.append("hello")
    things.append((3.0, 5.0))
    things.append(C333(name: "Leon",sex:false))
    things.append({ (name: String) -> String in "Hello, \(name)" })
    
    for thing in things {
        switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let movie as C333:
            print("a movie called '\(movie.name)', dir. \(movie.sex)")
        case let stringConverter as String -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
        }
    }
}

