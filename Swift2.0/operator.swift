//
//  operator.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/1/26.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

func testOverflowOperator(){
    var uIntMax = UInt8.max
    uIntMax = uIntMax &+ 1
    print(uIntMax)
    
}



struct Vector {
    var x:Double
    var y:Double
}

//运算符函数
func + (left:Vector,right:Vector)->Vector{
    return Vector(x: left.x + right.x, y: left.y + right.y)
}
func - (left:Vector,right:Vector)->Vector{
    return Vector(x: left.x - right.x, y: left.y - right.y)
}
prefix func - (vector:Vector)->Vector{
    return Vector(x: -vector.x, y: -vector.y)
}

func += (inout left:Vector,right:Vector)->Vector{
    left = left + right
    return left
}


//自定义运算符
infix operator ++++ { associativity left precedence 140 }

func ++++ (left:Vector,right:Vector)->Vector{
    return left + right + left + right
}




func testAssociativity(){
    let v1 = Vector(x: 10, y: 10)
    let v2 = Vector(x: 20, y: 20)
    let v3 = Vector(x: 100, y: 100)
    
    let v4 = v1 + v2 ++++ v3
    print("\(v4.x,v4.y)")
}











