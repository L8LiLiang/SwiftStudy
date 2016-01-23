//
//  initializer.swift
//  Swift2.0
//
//  Created by Chuanxun on 16/1/22.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation



class Product {
    var name:String
    convenience init() {
        
        self.init(name: "unnamed")
    }
    
    init(name:String){
        self.name = name
    }
    
    func desc()->Void{
        print(self.name)
    }
}


class Car:Product {
    var wheelNums:Int
    var brand:String
    init(wheelNums:Int,brand:String,name:String){
        self.wheelNums = wheelNums
        self.brand = brand
        super.init(name: name)
    }
    
    convenience init(wheelNums:Int,brand:String){
        self.init(wheelNums:wheelNums,brand:brand,name:"unnamed")
    }
    
    convenience override init(name: String) {
        self.init(wheelNums:4,brand:"yiqi",name:"unnamed")
    }
}

class Truck: Car {
    let loadWeight:Int = 100
    override func desc() {
        print("\(self.name,self.wheelNums,self.brand,self.loadWeight)")
    }
}




class Animal {
    var name:String
    //可失败构造器
    init?(name:String){
        self.name = name
        if name.isEmpty {return nil}
    }
    init(name2:String){
        self.name = name2
    }
    
}



//枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

//带原始值的枚举类型会自带一个可失败构造器init?(rawValue:)，该可失败构造器有一个名为rawValue的参数，其类型和枚举类型的原始值类型一致，如果该参数的值能够和某个枚举成员的原始值匹配，则该构造器会构造相应的枚举成员，否则构造失败。

//因此上面的TemperatureUnit的例子可以重写为：
enum TemperatureUnit2:Character {
    case Kelvin = "K"
    case Celsius = "C"
    case Fahrenheit = "F"
}




/*
构造失败的传递

类，结构体，枚举的可失败构造器可以横向代理到类型中的其他可失败构造器。类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。
*/
class JAX {
    var name:String
    required init(name:String){
        self.name = name
    }
    
    init?(name2:String){
        self.name = name2
        if name.isEmpty {return nil}
    }
}

class Leon: JAX {
    var quantity:Int
    init?(name:String,quantity:Int){
        self.quantity = quantity
        super.init(name2: name)
        if quantity < 0 {return nil}
    }
    required init(name: String) {
        self.quantity = 0
        super.init(name: name)
    }
    
    //析构
    deinit{
        print("deinit")
    }
}


/*
如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值。每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
*/
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}


func initializerTest()->Void{
    
    print("Hello Initializer")
    
    
    /*
    规则 1
    指定构造器必须调用其直接父类的的指定构造器。
    
    规则 2
    便利构造器必须调用同一类中定义的其它构造器。
    
    规则 3
    便利构造器必须最终导致一个指定构造器被调用。
    */
    
    let p1 = Product.init(name: "Knife")
    
    p1.desc()
    
    //如果你在子类重写父类的指定构造器，那么必须在定义子类构造器时带上override修饰符
    //你在子类中“重写”一个父类便利构造器时，不需要加override前缀
    
    
    
    /*
    //构造器的自动继承
    规则 1
    如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。
    
    规则 2
    如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承所有父类的便利构造器。（即使属性没有默认值，只要实现了父类的所有指定构造器，就会自动继承父类的所有便利构造器）
    */
    
    let trck = Truck(wheelNums: 8, brand: "dongfeng", name: "qingtianzhu")
    trck.desc()
    
    
    let ani = Animal(name: "")
    if let aaa = ani {
        print(aaa.name)
    }else {
        print("empty")
    }
    
    let temperature = TemperatureUnit(symbol: "L")
    print(temperature)
    
    let leon = Leon(name: "liliang", quantity: 1)
    if leon == nil {print("nil")} else {print("\(leon!.name)")}
    
    let board = Checkerboard()
    print(board.squareIsBlackAtRow(0, column: 1))
    
    
}



