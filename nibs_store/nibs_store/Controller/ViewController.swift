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
    let dataModel = DataManager()
    var orderList: [Order]  = []
    @IBOutlet weak var newOrderTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newOrderTable.delegate = self
        newOrderTable.dataSource = self
        newOrderTable.allowsSelection = false
        newOrderTable.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(orderCheckAlert), name: NSNotification.Name("orderCheck"), object: nil)
        //set datamodel
        dataModel.setup(storeHash: "pchash1")
        dataModel.getNewOrderList(){orderList in
            self.orderList = orderList
            self.newOrderTable.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func orderCheckAlert(_ notification: Notification){
        let order = notification.userInfo?["order"] as! String
        let orderHash = notification.userInfo?["orderHash"] as! String
        //show alert for checking specific order
        let alert = UIAlertController(title: order + " 주문을 접수하시겠습니까?" , message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "주문완료", style: .default, handler: { action in
            self.orderConfirm(orderHash: orderHash)
        })
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    func orderConfirm(orderHash: String){
        //remove order from new order and add order to order history
        dataModel.completeOrder(orderHash: orderHash)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewOrderListTableViewCell {
            cell.seatNoLabel.text = orderList[indexPath.row].seatNo
            cell.timeLabel.text = orderList[indexPath.row].time
            var name = orderList[indexPath.row].name
            if orderList[indexPath.row].quantity != "0" {
                name = name + " " + orderList[indexPath.row].quantity + "개"
            }
            cell.nameLabel.text = name
            cell.orderHash = orderList[indexPath.row].hashID
            return cell
        }
        return NewOrderListTableViewCell()
    }
    
}
