//
//  fun.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

/*
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

*/


/*
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

//递归枚举 非常牛逼🐂
/*
当各种可能的情况可以被穷举时，非常适合使用枚举进行数据建模，例如可以用枚举来表示用于简单整数运算的操作符。这些操作符让你可以将简单的算术表达式，例如整数5，结合为更为复杂的表达式，例如5 + 4。
*/

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

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))

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

*/
