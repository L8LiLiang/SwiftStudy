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


/*
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
*/

/*
//enum
enum Animate {
    case Dog
    case Cat
    case Chicken
    case Human
    case Mix1(Int,Int)
    case Mix2(String)
}

var aDog = Animate.Dog
var aMix1 = Animate.Mix1(10, 20)
var aMix2 = Animate.Mix2("Leon")
print(aDog)
print(aMix1)
print(aMix2)
aMix1 = Animate.Mix1(20, 30)
print(aMix1)


//原始值
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIControlCharacter.Tab)
var tab = ASCIIControlCharacter.Tab
print(tab)
print(tab.rawValue)


//递归枚举 非常牛逼🐂
/*
当各种可能的情况可以被穷举时，非常适合使用枚举进行数据建模，例如可以用枚举来表示用于简单整数运算的操作符。这些操作符让你可以将简单的算术表达式，例如整数5，结合为更为复杂的表达式，例如5 + 4。
算术表达式的一个重要特性是，表达式可以嵌套使用。例如，表达式(5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。
递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
*/


enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))



//InitializerTest
initializerTest()
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


/*
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

*/


//enum
enum Animate {
    case Dog
    case Cat
    case Chicken
    case Human
    case Mix1(Int,Int)
    case Mix2(String)
}

var aDog = Animate.Dog
var aMix1 = Animate.Mix1(10, 20)
var aMix2 = Animate.Mix2("Leon")
print(aDog)
print(aMix1)
print(aMix2)
aMix1 = Animate.Mix1(20, 30)
print(aMix1)


//原始值
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIControlCharacter.Tab)
var tab = ASCIIControlCharacter.Tab
print(tab)
print(tab.rawValue)


//递归枚举 非常牛逼🐂
/*
当各种可能的情况可以被穷举时，非常适合使用枚举进行数据建模，例如可以用枚举来表示用于简单整数运算的操作符。这些操作符让你可以将简单的算术表达式，例如整数5，结合为更为复杂的表达式，例如5 + 4。

算术表达式的一个重要特性是，表达式可以嵌套使用。例如，表达式(5 + 4) * 2，乘号右边是一个数字，左边则是另一个表达式。因为数据是嵌套的，因而用来存储数据的枚举类型也需要支持这种嵌套——这意味着枚举类型需要支持递归。

递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
*/


enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))


//Array

var nums = [Double](count: 3, repeatedValue: 10.0)

var nums2:Array<Double> = [1,2,3]

var nums3 = nums + nums2

print(nums3)

nums2 += [4,5,6]

nums2[3...5] = [7,8,9]

print(nums2)

nums2.append(12)

nums.insert(11, atIndex: 1)

nums.removeLast()

let removeNum = nums.removeAtIndex(1)

nums[0] = 100

print(nums)

for num in nums3 {
    var index = nums3.indexOf(num)//第一次出现的位置
    print("\(num,index) ")
}

for (index,value) in nums3.enumerate() {
    print("\(value,index) ")
}


//Set,
//Swift 中的Set类型被写为Set<Element>，这里的Element表示Set中允许存储的类型，和数组不同的是，集合没有等价的简化形式。

var set1:Set = [1,2,3,4]
var set2:Set = [1,2,3,4,5,6,7,8]
var set3:Set = [1,2,9,10]

print(set1.isSubsetOf(set2))
print(set1.isStrictSubsetOf(set2))
print(set1.isDisjointWith(set3))//是否没有交集

var newSet = set1.intersect(set3)
print(newSet)
newSet = set1.union(set3)
print(newSet)
newSet = set1.exclusiveOr(set3)
print(newSet)
newSet = set1.subtract(set3)
print(newSet)
set1.intersectInPlace(set3)
print(set1)



//Dictionary

var airports = ["LD":"london","BJ":"BeiJing","SH":"ShangHai"]
if let value = airports.updateValue("London", forKey: "LD") {
    print(value)
}
print(airports)


if let value = airports["LD"] {
    print(value)
}

airports["LDD"] = nil//移除值，没有也不报错
print(airports)

var value = airports.removeValueForKey("LD")
print(value)

airports["SZ"] = "ShengZhen"

for (code,name) in airports {
    print("\(code,name)")
}

var codes = airports.keys.sort()
var names = airports.values.sort()

for code in codes {
    print(code)
}
for name in names {
    print(name)
}



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


//函数

func sayHello(to person1:String, and person2:String){
    print("Hello \(person1,person2)")
}
sayHello(to: "Leon", and: "Lampard")

func sayHello2(person1:String, _ person2:String){
    print("Hello \(person1,person2)")
}
sayHello2("Leon", "Lampard")


//函数参数默认值
func someFunc(firstNum firstParam:Int,secondNum secondParam:Int = 1)->Int{
    return firstParam + secondParam
}

print(someFunc(firstNum: 10,secondNum: 2))


//可变参数 一个函数最多只能有一个可变参数。
func variadicParams(name:String = "Leon",param2 nums:Double...)->Double{
    var total = 0.0
    for num in nums {
        total += num
    }
    print(name)
    return total / (Double)(nums.count)
}

print(variadicParams("hehe",param2: 1,2,3,4))
print(variadicParams(param2: 3,4,5,6))



//输入输出参数 相当于传地址
func swapToInt(inout num1:Int, inout _ num2:Int){
    var tmp:Int
    tmp = num1
    num1 = num2
    num2 = tmp
}
var num1 = 10
var num2 = 20
swapToInt(&num1, &num2)
print(num1)


//函数作文参数
func addTwoInts(num1:Int,num2:Int)->Int{
    return num1 + num2
}
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

//函数作为返回值
func stepForward(inout num:Int){
    num++
}

func stepBack(inout num:Int){
    num--
}

func chooseFunc(greatThenZero:Bool)->(inout Int)->Void{
    if greatThenZero {
        return stepBack
    }else {
        return stepForward
    }
}
var num = 10
var myFunc = chooseFunc(num > 0)
myFunc(&num)
print(num)


//函数嵌套
func chooseFunc2(greatThenZero:Bool)->(inout Int)->Void{
    var step = 10
    func stepForward(inout num:Int){
        num += step
    }
    
    func stepBack(inout num:Int){
        num -= step
    }
    
    if greatThenZero {
        return stepBack
    }else {
        return stepForward
    }
}
myFunc = chooseFunc2(num > 0)
myFunc(&num)
print(num)

/*
//闭包 ＝＝ block
闭包可以捕获和存储其所在上下文中任意常量和变量的引用。这就是所谓的闭合并包裹着这些常量和变量，俗称闭包。Swift 会为您管理在捕获过程中涉及到的所有内存操作。

    全局函数是一个有名字但不会捕获任何值的闭包
    嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
*/




//InitializerTest
initializerTest()
