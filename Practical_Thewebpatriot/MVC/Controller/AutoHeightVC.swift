//
//  AutoHeightVC.swift
//  Practical_Thewebpatriot
//
//  Created by Sagar on 30/09/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class AutoHeightVC: UIViewController {

    
    @IBOutlet weak var txtData : UITextField!
    @IBOutlet  var tblView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.estimatedRowHeight = 21.0
        self.tblView.rowHeight = UITableView.automaticDimension

    }
    

}

extension AutoHeightVC: UITextFieldDelegate{
    
    
    
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        <#code#>
    }*/
    
    
    
}


extension  AutoHeightVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aXcell = tableView.dequeueReusableCell(withIdentifier: "aCellData", for: indexPath) as! aCellData
        aXcell.lblData.text = txtData.text
        return aXcell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}


class aCellData: UITableViewCell {
    
    @IBOutlet weak var lblData : UILabel!
}







