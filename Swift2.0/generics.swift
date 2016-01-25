//
//  generics.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/1/25.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation


func MySwap<T>(inout param1:T,inout param2:T)->Void{
    var tmp:T
    tmp = param1
    param1 = param2
    param2 = tmp
}




struct MyStack<T : Equatable> {
    var datas = [T]()
    mutating func push(item:T){
        datas.append(item)
    }
    mutating func pop()->T{
        return datas.removeLast()
    }
}

//当你扩展一个泛型类型的时候，你并不需要在扩展的定义中提供类型参数列表。更加方便的是，原始类型定义中声明的类型参数列表在扩展中可以直接使用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。

extension MyStack {
    var topItem:T? {
        return datas.isEmpty ? nil : datas.last
    }
}


//类型约束

func findIndex<T:Equatable>(container:[T],searchParam:T)->Int?{
    for (index,value) in container.enumerate() {
        if value == searchParam {
            return index
        }
    }
    return nil
}



func testGenerics(){
    var p1 = 10
    var p2 = 100
    MySwap(&p1, param2: &p2)
    print("\(p1,p2)")
    
    
    var stack = MyStack<String>()
    stack.push("Leon")
    stack.push("Lampard")
    stack.push("Terry")
    stack.push("Fabregras")
    print(stack)
    stack.pop()
    print(stack)
    print(stack.topItem)
    
    if let index = findIndex(["Leon","Lampard","Terry"], searchParam: "Lampard"){
        print(index)
    }else {
        print("not found")
    }
    
    
    
}




//关联类型
//定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型作为协议的一部分，为某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定。你可以通过 typealias 关键字来指定关联类型。
protocol Container {
    typealias ItemType
    mutating func append(item:ItemType)
    var count:Int {get}
    subscript(i:Int)->ItemType {get}
}



struct MyStack2<T>:Container {
    var datas = [T]()
    mutating func push(item:T){
        datas.append(item)
    }
    mutating func pop()->T{
        return datas.removeLast()
    }
    
    typealias ItemType = T
    mutating func append(item: ItemType) {
        push(item)
    }
    var count:Int {
        return datas.count
    }
    subscript(i:Int)->ItemType{
        return datas[i]
    }
}


//where子句

func allItemsMatch<C1:Container,C2:Container where C1.ItemType == C2.ItemType,C1.ItemType:Equatable>(someContainer:C1,anotherContainer:C2)->Bool{
    
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for index in 0..<someContainer.count {
        if someContainer[index] != anotherContainer[index] {
            return false
        }
    }
    
    return true
    
}

//通过扩展一个存在的类型来指定关联类型
extension Array:Container {}


func testWhere(){
    var stack = MyStack2<String>()
    stack.push("Leon")
    stack.push("Lampard")
    stack.push("Terry")
    
    
    let array = ["Leon","Lampard","Terry"]
    
    if allItemsMatch(stack, anotherContainer: array) {
        print("all match")
    }else {
        print("not match")
    }
}
