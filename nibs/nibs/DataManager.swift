//
//  DataModel.swift
//  nibs
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
    var ref : DatabaseReference! = Database.database().reference()
    var appdelegate = UIApplication.shared.delegate as? AppDelegate
    
//    func getNewOrderList(storeHash: String, completion: @escaping ([Menu]) -> ()){
//        let localRef = ref.child(storeHash).child("menu")
//        localRef.observeSingleEvent(of: DataEventType.value, with:  { (snapshot) in
//            
//        })
//    }
    
}
