//
//  main.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/10.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
//get set villSet didSet
class Shape {
    var sideNums:Int = 0
    
    init(sideNums:Int){
        self.sideNums = sideNums
    }
    
    func simpleDesc() ->String {
        return " sideNums \(sideNums)"
    }
}

class Triangle : Shape {
    var length1:Int
    var length2:Int
    var length3:Int
    
    init(length1:Int,length2:Int,length3:Int){
        self.length1 = length1
        self.length2 = length2
        self.length3 = length3
        super.init(sideNums: 3)
    }
    
    override func simpleDesc() -> String {
        return super.simpleDesc() + " \(length1)" + " \(length2)" + " \(length3)"
    }
  
}


class Square : Shape {
    var length:Int
    
    init(length:Int){
        self.length = length
        super.init(sideNums: 4)
    }
    
    override func simpleDesc() -> String {
        return " square length = \(length)"
    }
}


class SquareAndTriangle : Shape {
    
    //suqare.length = triangle.length1
    var square:Square {
        willSet {
            triangle.length1 = newValue.length
        }
    }
    var triangle:Triangle {
        willSet {
            square.length = newValue.length1
        }
    }
    
    init(square:Square,triangle:Triangle){
        self.square = square
        self.triangle = triangle
        super.init(sideNums: 7)
    }
    
    var totalLength:Int {
        get {
            return square.length * 4
        }
        
        set {
            square.length = newValue / 4
        }
    }
    
    override func simpleDesc() -> String {
        return " SquareAndTriangle " + square.simpleDesc() + triangle.simpleDesc()
    }
}

var triangle = Triangle(length1: 10, length2: 15, length3: 8)
print(triangle.simpleDesc())
var square = Square(length: 20)
print(square.simpleDesc())
var squareAndTriangle = SquareAndTriangle(square: square, triangle: triangle)
print(squareAndTriangle.simpleDesc())
squareAndTriangle.square = Square(length: 30)
print(squareAndTriangle.simpleDesc())
print(squareAndTriangle.totalLength)

//变量可选
//let optionalSquare: Square? = Square(length: 8)
let optionalSquare: Square? = nil
//在对可选变量进行操作时，需要加上｀？｀
let sideLength = optionalSquare?.length
print(sideLength)



//enum

enum MyNum:Int {
    case zero = 0
    case one,two,three,four
    
    func simpleDesc() ->String {
        switch self {
        case .zero:
            return "zero"
        case .one:
            return "one"
        case two:
            return "two"
        default:
            return "\(self.rawValue)"
        }
    }
}

var num0 = MyNum.zero
print(num0)
var num0Rawvalue = num0.rawValue
print(num0Rawvalue)

var num1 = MyNum(rawValue: 1)
print(num1)
print(num1?.rawValue)

var num4 = MyNum.four
print(num4.simpleDesc())

enum Suit:Int {
    case person
    case dog
    case cat
    
    func simpleDesc()->String {
        switch self {
        case .person:
            return "person"
        case .dog:
            return "dog"
        default:
            return "\(self.rawValue)"
        }
    }
}

var suitCat = Suit.cat
print(suitCat.simpleDesc())


//struct和类很相像，它们之间最大的一个区别就是结构体是传值，类是传引用。
struct Card {
    var rank: Int
    var suit: Int
    func simpleDescription() -> String {
        return "The \(rank) of \(suit)"
    }
}
let threeOfSpades = Card(rank: 1, suit: 2)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



//enum的特殊用法
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}



//protocol

protocol SimpleProtocol {
    var desc:String {get}//协议 必须声明get或get set
    mutating func adjust()
}

struct SimpleStruct : SimpleProtocol {
    var desc:String
    var age:Int
    init(age:Int,desc:String) {
        self.age = age
        self.desc = desc
    }
    mutating func adjust() {//mutating 声明该方法会修改成员属性
        self.desc += "SimpleStruct"
    }
}

class SimpleClass : SimpleProtocol {
    var desc:String
    var age:Int
    init(age:Int,desc:String) {
        self.age = age
        self.desc = desc
    }
    func adjust() {
        self.age += 10
        self.desc += " desc "
    }
    func sayHello()->Void {
        print("Hello")
    }
}
//枚举如何实现协议？？？？
//enum SimpleEnum :SimpleProtocol {
//    case liliang,liming,like,desc
//    func adjust() {
//        
//    }
//}

var simplePro:SimpleProtocol = SimpleClass(age: 10, desc: "hello")
print(simplePro.desc)
//simplePro.sayHello     //error



//extension
extension Int:SimpleProtocol {
    var desc:String {
        return "\(self)"
    }
    mutating func adjust() {
        self += 10
    }
}

var age:Int = 10
age.adjust()
print(age.desc)


//范型
func templateFunc<Item>(item:Item,numbers:Int) ->[Item] {
    var result = [Item]()
    for _ in 0 ..< numbers {
        result.append(item)
    }
    return result
}

var result = templateFunc("knock", numbers: 10)
print(result)


//tuples 元组
var httpError = (statusCode:404,desc:"Not Found")

var (sc,desc) = httpError
print("\(sc) \(desc)")

print(httpError.0)
print(httpError.desc)



/**nil 值缺失
Int? 表示可选Int，它是一种类型

Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
*/


/*

使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。
*/
var optionalNum = "250"

if let actualNum = Int(optionalNum) {
    print("optionalNum convert to num \(actualNum)")
} else {
    print("optionalNum can not convert to num")
}

var optionalNum2:Int? = 290
if var actualNum = optionalNum2 {
    print("optionalNum convert to num \(++actualNum)")
} else {
    print("optionalNum can not convert to num")
}
print(optionalNum2)

if  let firstNum = Int(optionalNum), secondNum = optionalNum2 where firstNum < secondNum {
    print("yes")
}else {
    print("no")
}



//一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值。下面的例子展示了可选类型String和隐式解析可选类型String之间的区别：
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

*/








//字符串是值类型（Strings Are Value Types）
/*
Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。 值类型在 结构体和枚举是值类型 中进行了详细描述。
*/

let characterArray:[Character] = ["I","L","U","❤️"]
var str = String(characterArray)
print(str)

str += "oY"
print(str)

var c:Character = "H"
str.append(c)
print(str)


//字符串索引和遍历
let greeting = "Greeting dog!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]

for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: " ")
}
print("\n")

//字符串 插入 删除
var hello = "Hello there"
hello.insert("!", atIndex: hello.endIndex)
hello.insertContentsOf("\tLeon".characters, at: hello.endIndex)
print(hello)

hello.removeAtIndex(hello.endIndex.advancedBy(-5))
print(hello)

let range = hello.endIndex.advancedBy(-4)..<hello.endIndex
hello.removeRange(range)
print(hello)



//分别根据utf8 utf16 unicodeScalar取字符串每一位的值
let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit)",terminator:" ")
}
print("\n")

for codeUnit in dogString.utf16 {
    print("\(codeUnit)",terminator:" ")
}
print("\n")

for codeUnit in dogString.unicodeScalars {
    print("\(codeUnit)",terminator:" ")
}
print("\n")




