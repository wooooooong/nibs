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

class DataModel {
    // 기본 데이터 레퍼런스
    var ref : DatabaseReference! = Database.database().reference()
    var appdelegate = UIApplication.shared.delegate as? AppDelegate
    
    func getNewOrderList(storeHash: String){
        let localRef = ref.child(storeHash)
        localRef.observe(DataEventType.value, with: { (snapshot) in
          
        })
    }

}

