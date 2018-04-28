//
//  Menu.swift
//  nibs
//
//  Created by mac on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//

import Foundation

class Menu {
    var hashID : String
    var seatNo : String
    var time : String
    var name : String
    var quantity : String
    init() {
        self.seatNo = ""
        self.hashID = ""
        self.time = ""
        self.name = ""
        self.quantity = ""
    }
    init(seatNo: String, hashID : String, time : String, name : String, quantity : String) {
        self.seatNo = seatNo
        self.hashID = hashID
        self.time = time
        self.name = name
        self.quantity = quantity
    }
}

