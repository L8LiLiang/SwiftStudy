//
//  String.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

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
