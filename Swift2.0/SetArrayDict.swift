//
//  SetArrayDict.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

/*
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

*/
