//
//  protocol.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/24.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation


protocol p1 {
    var v1:String {set get}
    var v2:Int {get}
    func desc()->String
    
    init(name:String)//required
}

class c1:p1 {
    var name:String
    var v1:String {
        get{
          return name
        }
        set{
         name = newValue
        }
    }
    var v2:Int = 0
    required init(name:String = "leon")
    {
        self.name = name
    }
    func desc() -> String {
        return "My name is \(name)"
    }
}

func protocolTest(){
    let ccc = c1()
    print(ccc.v1)
    print(ccc.desc())
    
    
    //协议作为类型
    var protocolAsType = [p1]()
    protocolAsType.append(c1(name: "drogba"))
    protocolAsType.append(c1(name: "lampard"))
    
    for p in protocolAsType {
        print(p.desc())
    }
}


//委托 代理 模式

protocol Game{
    var name:String {get}
    func play()
    func stop()
}

protocol P2 {
    func gameDidStart(game:Game)->Void
    func gameDidEnd(game:Game)
}

class PokerGame:Game {
    var name = "poker"
    var delegate:P2?
    func play() {
        delegate?.gameDidStart(self)
    }
    func stop() {
        delegate?.gameDidEnd(self)
    }
}

class GameWatcher : P2 {
    func gameDidStart(game:Game) {
        print("game \(game.name) start")
    }
    func gameDidEnd(game: Game) {
        print("game \(game.name) end")
    }
}


//可以对协议进行扩展
extension Game {
    func restart(){
        stop()
        play()
    }
}

func delegateTest(){
    let game = PokerGame()
    let watcher = GameWatcher()
    game.delegate = watcher
    game.play()
    
    game.restart()
}



//协议可以继承协议

//｀类｀ 类型的专属协议，只能被类使用，不能被结构体 枚举使用
protocol SomeClassOnlyProtocol: class, P2 {
    // 这里是类类型专属协议的定义部分
}


//协议合成
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person3: Named, Aged {
    var name: String
    var age: Int
}

func protocolCelebrator(){

    func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
        print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
    }
    let birthdayPerson = Person3(name: "Malcolm", age: 21)
    wishHappyBirthday(birthdayPerson)
}

//可以对协议使用 is as

/*
//协议中的变量和方法可以是optional
注意
可选的协议要求只能用在标记 @objc 特性的协议中。
该特性表示协议将暴露给 Objective-C 代码，详情参见Using Swift with Cocoa and Objective-C(Swift 2.1)。即使你不打算和 Objective-C 有什么交互，如果你想要指定可选的协议要求，那么还是要为协议加上 @obj 特性。
还需要注意的是，标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc 类采纳，其他类以及结构体和枚举均不能采纳这种协议。

@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
*/


/*
协议扩展
协议可以通过扩展来为采纳协议的类型提供属性、方法以及下标的实现。通过这种方式，你可以基于协议本身来实现这些功能，而无需在每个采纳协议的类型中都重复同样的实现，也无需使用全局函数。


//通过扩展采纳协议
当一个类型已经符合了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空扩展体的扩展来采纳该协议：

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}


//提供默认实现
可以通过协议扩展来为协议要求的属性、方法以及下标提供默认的实现。如果采纳协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用。
*/

/*
//为协议扩展添加限制条件
在扩展协议的时候，可以指定一些限制条件，只有采纳协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。这些限制条件写在协议名之后，使用 where 子句来描述，正如Where子句)中所描述的。

例如，你可以扩展 CollectionType 协议，但是只适用于集合中的元素采纳了 TextRepresentable 协议的情况：

extension CollectionType where Generator.Element: TextRepresentable {
var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}
*/

protocol P3 {
    var name:String {set get}
    func desc()
}

extension P3 {
    var name:String {
        return "unnamed"
    }
    func desc() {
        print("unnamed desc")
    }
}

class C3:P3 {
    var age = 10
}

func textProtocolExtension(){
    var ccc = C3()
    
}
