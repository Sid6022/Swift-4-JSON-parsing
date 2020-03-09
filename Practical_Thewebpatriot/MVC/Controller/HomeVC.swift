//
//  ViewController.swift
//  Practical_Thewebpatriot
//
//  Created by Sagar on 16/09/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var arrHomeData = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrHomeData = [["Search Article"],["Most Viewd","Most Shared","Most Emailed"]]
    }
    
}
extension HomeVC : UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrHomeData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHomeData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aData = arrHomeData[indexPath.section][indexPath.row]
        let aCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as UITableViewCell
        aCell.textLabel?.text = aData
        return aCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let arrTitle = ["Search","Popular"]
        return arrTitle[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let anextController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        self.navigationController?.pushViewController(anextController, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           
           //Bottom Refresh
           if scrollView == self.tblViewOrderList{
               let currentOffset = scrollView.contentOffset.y
               let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
               if (maxOffset - currentOffset <= 30.0)
               {
                //API call
//                   if self.totalRecord != 0 && self.totalRecord != self.arrOrderList?.count {
//                       pageNo += 1
//                       OrderListAPI()
//                   }
               }
           }
       }
    
    
}
