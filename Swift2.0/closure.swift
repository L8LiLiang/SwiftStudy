//
//  closure.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

/*
//闭包 ＝＝ block
闭包可以捕获和存储其所在上下文中任意常量和变量的引用。这就是所谓的闭合并包裹着这些常量和变量，俗称闭包。Swift 会为您管理在捕获过程中涉及到的所有内存操作。

全局函数是一个有名字但不会捕获任何值的闭包
嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
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
