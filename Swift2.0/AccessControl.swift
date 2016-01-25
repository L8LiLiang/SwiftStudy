//
//  AccessControl.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/1/25.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

private func testAccess1(){
    print("testAccess1")
}

internal func testAccess2(){
    print("testAccess2")
    testAccess1()
}


private class Class1 {
    var value1:Int = 1 //private
}

internal class Class2 {
    var value1:Int = 1 //internal
}

public class Class3 {
    var value1:Int = 1 //internal
    private var value2:Int = 2
}

//元组类型的访问控制
//元组的访问级别将由元组中访问级别最严格的类型来决定。
//元组不同于类、结构体、枚举、函数那样有单独的定义。元组的访问级别是在它被使用时自动推断出的，而无法明确指定。



//函数类型
//函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。


//枚举类型
//枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。
//枚举定义中的任何原始值或关联值的类型的访问级别至少不能低于枚举类型的访问级别。例如，你不能在一个 internal 访问级别的枚举中定义 private 级别的原始值类型。



//嵌套类型
//如果在 private 级别的类型中定义嵌套类型，那么该嵌套类型就自动拥有 private 访问级别。如果在 public 或者 internal 级别的类型中定义嵌套类型，那么该嵌套类型自动拥有 internal 访问级别。如果想让嵌套类型拥有 public 访问级别，那么需要明确指定该嵌套类型的访问级别。



//子类
//子类的访问级别不得高于父类的访问级别。例如，父类的访问级别是 internal，子类的访问级别就不能是 public。
//此外，你可以在符合当前访问级别的条件下重写任意类成员（方法、属性、构造器、下标等）。

public class ClassA{
    private func desc(){
        print("ClassA")
    }
}
internal class ClassB: ClassA {
    internal override func desc() {
        print("ClassB")
    }
}


//常量、变量、属性、下标
//常量、变量、属性不能拥有比它们的类型更高的访问级别。例如，你不能定义一个 public 级别的属性，但是它的类型却是 private 级别的。同样，下标也不能拥有比索引类型或返回类型更高的访问级别。



//getter setter
public struct MyStruct2{
    public private(set) var numberOfEdits = 0
    public var name:String {
        didSet{
            numberOfEdits++
        }
    }
}

func testGetterSetterAccessControl(){
    var struct2 = MyStruct2(numberOfEdits: 0, name: "leon")
    print(struct2.numberOfEdits)
    struct2.name = "lampard"
    print(struct2.numberOfEdits)
}




//构造器
//自定义构造器的访问级别可以低于或等于其所属类型的访问级别。唯一的例外是必要构造器，它的访问级别必须和所属类型的访问级别相同。


//协议
//如果想为一个协议类型明确地指定访问级别，在定义协议时指定即可。这将限制该协议只能在适当的访问级别范围内被采纳。
//协议中的每一个要求都具有和该协议相同的访问级别。你不能将协议中的要求设置为其他访问级别。这样才能确保该协议的所有要求对于任意采纳者都将可用。


private protocol PrivateProtocol {
    
}

private protocol InternalProtocol:PrivateProtocol {
    //继承了private级别的协议之后，InternalProtocol也变成private了
    //只能高级别的协议基础低级别的协议，private级别的协议，不能继承public和internal级别的协议
}


//extension

extension Class1 {
    var ext1:Int {//private because Class1 is private
        get{
            return 10
        }
    }
}



//泛型
//泛型类型或泛型函数的访问级别取决于泛型类型或泛型函数本身的访问级别，还需结合类型参数的类型约束的访问级别，根据这些访问级别中的最低访问级别来确定。


