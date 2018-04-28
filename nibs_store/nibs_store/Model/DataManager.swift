//
//  DataSource.swift
//  nibs_store
//
//  Created by mac on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class DataManager {
    // 기본 데이터 레퍼런스
    var refer: DatabaseReference!
    func setup(storeHash: String) {
        refer = Database.database().reference().child(storeHash)
    }
    func getNewOrderList(completion: @escaping ([Order]) -> ()){
        let localRef = refer.child("newOrder")
        localRef.observe(DataEventType.value, with: { (snapshot) in
            var orderList: [Order]  = []
            for childSnapshot in snapshot.children {
                let snapshot = childSnapshot as! DataSnapshot
                let orderHash = snapshot.key
                let orderFull = snapshot.value as! String
                let orderArray = orderFull.characters.split{$0 == "/"}.map(String.init)
                let order = Order(seatNo: orderArray[0],hashID : orderHash, time : orderArray[1], name : orderArray[2], quantity : orderArray[3])
                orderList.append(order)
            }
            completion(orderList)
        })
    }
    func completeOrder(orderHash: String){
        refer.child("newOrder").child(orderHash).removeValue()
    }

}

