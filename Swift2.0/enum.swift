//
//  enum.swift
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

*/