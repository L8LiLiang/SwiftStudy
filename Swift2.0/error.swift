//
//  error.swift
//  Swift2.0
//
//  Created by 李亮 on 16/1/24.
//  Copyright © 2016年 李亮. All rights reserved.
//

import Foundation


enum MyError:ErrorType{
    case InvalidSelection
    case InsufficientFunds(needCoins:Int)
    case OutofStock
}

struct Item {
    var price:Int
    var count:Int
}

class vendingMachine {
    var inventory = [
        "Candy Bar":Item(price: 10, count: 100),
        "Chips":Item(price: 4, count: 300),
        "Football":Item(price: 120, count: 10)
    ]
    
    var conisDeposited = 0
    func dispenseSnack(snack:String){
        print("Dispensing \(snack)")
    }
    
    func vend(itemName name:String) throws ->Void{
        guard var item = inventory[name] else {
            throw MyError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw MyError.OutofStock
        }
        
        guard item.price <= conisDeposited else {
            throw MyError.InsufficientFunds(needCoins: item.price - conisDeposited)
        }
        
        conisDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
}


let favoriteSnacks = [
    "Leon":"Candy Bar",
    "Lampard":"Chips",
    "Drogba":"Football"
]


func buyFavoritySnack(person:String,vendMachine:vendingMachine) throws ->Void{
    let snackName = favoriteSnacks[person] ?? "Football"
    try vendMachine.vend(itemName: snackName)
}


func errorTest(){
    let machine = vendingMachine()
    machine.conisDeposited = 10
    do{
        try buyFavoritySnack("Drogba", vendMachine: machine)
    }catch MyError.InsufficientFunds(let needCoins){
        print("need more \(needCoins) coins")
    }catch MyError.InvalidSelection{
        print("Wrong Selection")
    }catch MyError.OutofStock {
        print("OutofStock")
    }catch{
       print("Unknown error")
    }
}

func errorThrow(throwError:Bool) throws ->Int{
    defer {
        print("defer 1")//second execute
        print("defer 1.1")
    }
    defer {
        print("defer 2")//first execute
    }
    if throwError {
        throw MyError.OutofStock
    }
    else {
        return 1
    }
}

func errorTest2(){
    let rtn = try? errorThrow(false)
    if rtn == nil {
        print("error throwed")
    }else {
        print("no error")
    }
}


