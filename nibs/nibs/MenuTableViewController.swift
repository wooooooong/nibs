//
//  MenuTableViewController.swift
//  nibs
//
//  Created by Tedigom on 2018. 4. 28..
//  Copyright © 2018년 nibs. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

enum cellStyle{
    case timeCell
    case generalCell
}

class MenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var orderCompleteView: UIView!

    var dataModel = DataManager()
    var dummySectionData = ["시간", "먹거리", "마실거리"]
    var dummyData = [[("1시간",1000),("2시간",2000),("3시간",3000),("4시간",4000),("5시간",5000)],[("햄버거",2000),("오징어",1500),("핫도그",3000)],[("콜라",1000),("사이다",1000),("환타",1000)]]
    
    var totalPrice = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        putSettingMenuTableView()
//        dataModel.getNewOrderList(storeHash: "pchash1")
        // Do any additional setup after loading the view.
    }
    
    func putSettingMenuTableView(){
        menuTableView.delegate = self
        menuTableView.dataSource = self
    menuTableView.allowsMultipleSelection = true
        orderCompleteView.alpha = 0
    }
    func getDataFromServer(){
        let ref = Database.database().reference().child("Posts")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            print(snapshot.childrenCount)
            
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                
                guard let value = rest.value as? Dictionary<String,Any> else { continue }
                
                guard let  title = value["Title"] as? String else { continue }

            }

    })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummySectionData.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dummySectionData[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData[section].count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0{
        var cell: MenuTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell)
        
        if cell == nil {
            cell = (tableView.dequeueReusableCell(withIdentifier: "Cell") as! MenuTableViewCell)
        }
        
        //기본 설정 셋팅
        cell?.menuTitle.text = dummyData[section][row].0
        cell?.priceLabel.text = String(dummyData[section][row].1)+"원"
        return cell!
        }else{
            var cell: MenuPhotoTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! MenuPhotoTableViewCell)
            
            if cell == nil{
                cell = (tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! MenuPhotoTableViewCell)
            }
            
            cell?.menuTitle.text = dummyData[section][row].0
            cell?.priceLabel.text = String(dummyData[section][row].1)+"원"
            cell?.cellImageView.image = UIImage(contentsOfFile: "nibsIcon.png")
            cell?.cellImageView.
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            totalPrice += dummyData[indexPath.section][indexPath.row].1
            totalPriceLabel.text = String(totalPrice)+"원"
        }else{
            
        }
 
        }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        totalPrice -= dummyData[indexPath.section][indexPath.row].1
        totalPriceLabel.text = String(totalPrice)+"원"
        }else{
            
        }
    }
    
    @IBAction func selectOrderButton(_ sender: Any) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.orderCompleteView.alpha = 1.0
        }, completion: {
            (finished: Bool) -> Void in
            // Fade in
            UIView.animate(withDuration: 1.0, delay: 2.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.orderCompleteView.alpha = 0.0
            }, completion: nil)
        })
    }
    
    @IBAction func selectStepper(_ sender: Any) {
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
