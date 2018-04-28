//
//  DataSource.swift
//  nibs_store
//
//  Created by mac on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//
import Foundation
import FirebaseDatabase
class Order {
    var hashID : String
    var time : String
    var name : String
    var quantity : Int
    init() {
        self.hashID = ""
        self.time = ""
        self.name = ""
        self.quantity = 1
    }
    init(hashID : String, time : String, name : String, quantity : Int) {
        self.hashID = hashID
        self.time = time
        self.name = name
        self.quantity = quantity
    }
    convenience init(snapshot : DataSnapshot){
        let dict = snapshot.value as? Dictionary<String,AnyObject> ?? [:]
    }
}
