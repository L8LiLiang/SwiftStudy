//
//  OptionalChaining.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/23.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation

class Person1 {
    var name:String
    var address:Address?
//    init(name:String,address:Address){
//        self.name = name
//        self.address = address
//    }
    init(){
        self.name = "unnamed"
    }
}


class Address {
    var building:String?
    var street:String?
    func desc()->String?{
        if self.building != nil {
            return self.building
        }else if self.street != nil {
            return self.street
        }else {
            return nil
        }
    }
}

func testOptionalChaining(){
    let ppp = Person1()
    if let rtn = ppp.address?.street
    {
        print(rtn)
    }else {
        print("no street")
    }
    
    let adr = Address()
    adr.building = "bcjxcssl"
    ppp.address = adr
    
    if let rtn = ppp.address?.building
    {
        print(rtn)
    }else {
        print("no street")
    }

    let count = ppp.address?.desc()?.characters.count
    print(count)
}

