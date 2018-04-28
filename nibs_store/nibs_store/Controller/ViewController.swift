//
//  ViewController.swift
//  nibs_store
//
//  Created by mac on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var newOrderArray = [String:String]()
    let dataModel = DataModel()
    @IBOutlet weak var newOrderTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newOrderTable.delegate = self
        newOrderTable.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func orderCheckAlert(order: String, orderHash: String){
        //show alert for checking specific order
        let alert = UIAlertController(title: order + " 주문을 접수하시겠습니까?" , message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "주문완료", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: { action in
            self.orderConfirm(orderHash: orderHash)
        })
        alert.addAction(ok)
        alert.addAction(cancel)
        let parentVC = self.parent
        parentVC?.present(alert, animated: true, completion: nil)
    }
    func orderConfirm(orderHash: String){
        //remove order from new order and add order to order history
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
}
