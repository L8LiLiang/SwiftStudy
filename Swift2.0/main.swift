//
//  main.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/10.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

print("Hello, World!")

//
//  main.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/1/7.
//  Copyright © 2016年 Chuanxun. All rights reserved.
//


//http://wiki.jikexueyuan.com/project/swift/chapter1/02_a_swift_tour.html


import Foundation

print("Hello, World!")


/*

/**
var 变量
let 常量

swift没有隐式类型转换
*/
var intVar = 10
var doubleVar:Double = 20.5
var bookName:String = "The Swift Programming Language "
var info = bookName + String(doubleVar)
print(info)

let constNum = 888


//有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠。
var des = "I buy \(bookName)"
print(des)


/**
Array:

Dictionary:
*/

let shoopingList = ["book","food","iPhone",]
let price = ["book":28.5,"food":10,"iPhone":5888]
print(shoopingList)
print(price)

let familyMember:[String] = ["father","mother","brother","sister"]
let familyAge = [String:Int]()
print(familyMember)



//if语句判断条件必须是bool，循环和条件语句的包裹条件和循环变量括号可以省略，但是语句体的括号不能省略
if price.count == 3 {
print("price.count = 3")
}

var shoopings = ""
for shooping in shoopingList {
shoopings += shooping
}
print(shoopings)


/**
如果变量的可选值是nil，条件会判断为false，大括号中的代码会被跳过。如果不是nil，会将值赋给let后面的常量，这样代码块中就可以使用这个值了。
*/

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
greeting = "Hello, \(name)"
}else {
greeting = "Hello Leon"
}
print(greeting)

//另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。
var optionalName2 = "Hi, \(optionalName ?? "Leon")"
print(optionalName2)



//switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
let vegetable = "red pepper"
switch vegetable {
case "celery":
print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
print("Is it a spicy \(x)?")
default:
print("Everything tastes good in soup.")
}


//for in
let interestingNumbers = [
"Prime": [2, 3, 5, 7, 11, 13],
"Fibonacci": [1, 1, 2, 3, 5, 8],
"Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
for number in numbers {
if number > largest {
largest = number
}
}
}
print(largest)


//while
var n = 2
while n < 100 {
n = n * 2
}
print(n)

repeat {
n = n * 2
}while n < 1000

print(n)

// ..< 和 ...运算符, 使用 ..<创建的范围不包含上界，如果想包含的话需要使用...
for i in 0 ..< 10 {
print(i)
}



/**
使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值的类型。


*/
func sayHello(name:String,day:String) ->String {
return "Hello \(name) \(day)"
}

var thatWorld = sayHello("leon", day: "2016-01-09")
print(thatWorld)


//使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
func caculateStatistics(nums:[Int]) -> (min:Int,max:Int,avg:Float) {
var min:Int = nums[0]
var max:Int = nums[0]
var sum:Int = 0
var avg:Float = 0.0

for i in nums {
if i < min {
min = i
}else if i > max {
max = i
}
sum += i
}

avg = Float(sum) / Float(nums.count)

return (min,max,avg)
}

var statistics = caculateStatistics([1,10,2,8])
print(statistics.max)
print(statistics.2)



//函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
func variableParams(nums:Int...) -> Int {
var max:Int = 0
for i in nums {
if i > max {
max = i
}
}

return max
}

//函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数
func returnFifteen() -> Int {
var y = 10
func add() {
y += 5
}
add()
return y
}
returnFifteen()


//函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> ((Int,Int) -> Int) {
func addOne(number: Int,number2: Int) -> Int {
return 1 + number + number2
}
return addOne
}
var increment = makeIncrementer()
var result = increment(7,8)
print(result)



//函数也可以当做参数传入另一个函数。
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
for item in list {
if condition(item) {
return true
}
}
return false
}
func lessThanTen(number: Int) -> Bool {
return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)



/**
闭包
是一段代码，
函数是特殊的闭包，可以通过函数名进行调用

你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离。

*/
var mapResult = numbers.map({
(number: Int) -> Int in    //使用｀in｀分离｀参数返回值类型｀和｀函数体｀
var result = 3 * number
if number % 2 != 0 {
result = 0
}
return result
})
print(mapResult)


//如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)


//你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
numbers = [10,25,15,30]
let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)




/**
Class


*/

class Person {
var name:String
var age:Int = 0

init(name:String,age:Int) {
self.name = name
self.age = age
}

deinit {
print("deinit")
}

func simpleDesc() -> String {
return "\(self.name),\(self.age)"
}
}

var p1 = Person(name: "leon", age: 31)
print(p1.simpleDesc())


//继承
class Teacher : Person {
var teachYears:Int = 0

init(name:String,age:Int,teachYears:Int) {
super.init(name: name, age: age)
self.teachYears = teachYears
}

override func simpleDesc() -> String {
let desc = super.simpleDesc()
return "Teacher " + desc
}

}
var t1 = Teacher(name: "leon", age: 31, teachYears: 9)
print(t1.simpleDesc())

*/


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




/*
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

*/



//closure 闭包
var person = ["Leon","Lampard","Messi","Ronalod","Bogba","Nedved"]
var sortedPerson = person.sort({(string1:String,string2:String)->Bool in return string1 < string2})
print(sortedPerson)
var sortedPerson2 = person.sort({(s1,s2) in return s1 > s2})
print(sortedPerson2)
sortedPerson2 = person.sort({$0 < $1})
print(sortedPerson2)



//尾随闭包
/*
尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用：
如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉：
*/
var nums = [12,30,54,67,9,888]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

var output = nums.map {
    (var number)->String in
    var output:String = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    
    return output
}
print(output)

//闭包值捕获
func makeIncrement(forIncrement:Int)->()->Int {
    var totalNum = 0
    func increment()->Int {
        totalNum += forIncrement
        return totalNum;
    }
    return increment
}

var incrementer = makeIncrement(10)
print(incrementer())
print(incrementer())

var incrementer2 = makeIncrement(7)
print(incrementer2())
print(incrementer2())

//闭包是引用类型

/*
//非逃逸闭包，默认是逃逸
当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注@noescape，用来指明这个闭包是不允许“逃逸”出这个函数的。将闭包标注@noescape能使编译器知道这个闭包的生命周期（译者注：闭包只能在函数体中被执行，不能脱离函数体执行，所以编译器明确知道运行时的上下文），从而可以进行一些比较激进的优化。
*/

var completeHandles:[()->Void] = []
func someFuncWithEscapeClosure(closure:()->Void){
    completeHandles.append(closure)
}

func someFuncWithNoEscapeClosuer(@noescape closure:()->Void){
    closure()
}

class Test {
    var x = 0
    func domeSomething(){
        someFuncWithEscapeClosure(){
            self.x = 20
        }
        someFuncWithNoEscapeClosuer(){
            x = 40
        }
    }
}

var test = Test()
test.domeSomething()
print(test.x)

completeHandles.first?()
print(test.x)


//自动闭包
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够用一个普通的表达式来代替显式的闭包，从而省略闭包的花括号。
var customersInLine = ["Ewa", "Barry", "Daniella"]
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))
// prints "Now serving Ewa!"

