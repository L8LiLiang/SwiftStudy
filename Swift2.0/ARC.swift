//
//  ARC.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation


class Person {
    var name:String
    var dog:Dog!
    init(name:String){
        self.name = name
        self.dog = Dog(name: "laohei", owner: self)
    }
    
    deinit{
        print("\(self.name) deinit")
    }
}

class Dog {
    var name:String
    unowned var owner:Person
    init(name:String,owner:Person){
        self.name = name
        self.owner = owner
    }
    
    deinit{
        print("\(self.name) deinit")
    }
}

func arcTest(){
    var p:Person? = Person(name: "Leon")
    print(p!.name)
    p = nil
    print("end")
}





class TestReferece {
    var name:String
    lazy var desc:Void ->String = {
        [unowned self] in
        print(self.name)
        return self.name
    }
    init() {
        self.name = "Leon lampard"
    }
    
    deinit{
        print("TestReferece deinit")
    }
}


func testClosureReference()->Void{
    var ttt:TestReferece? = TestReferece()
    ttt!.desc()
    ttt = nil
    print("end")
}



