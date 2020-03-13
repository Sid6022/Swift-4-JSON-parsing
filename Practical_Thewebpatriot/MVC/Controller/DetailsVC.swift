//
//  DetailsVC.swift
//  Practical_Thewebpatriot
//
//  Created by Sagar on 18/09/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var tblDetails: UITableView!
    var arrNyData = [myData]()
    var Api : String?
    var strTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = strTitle
        parseJSON()
    }
    


    //MARK:- API call
    func parseJSON() {
        showLoader("")
        let url = URL(string: Api ?? "")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            hideLoader()
            guard error == nil else {
                print("returning error")
                return }
            guard let content = data else {
                print("not returning data")
                return }
            
            let decoder = JSONDecoder()
            let aData = try? decoder.decode(aJsonData.self, from: content)
        
        DispatchQueue.main.sync {
            self.arrNyData = aData!.results
            self.tblDetails.reloadData()
          }
        }
        task.resume()
    }
}


extension DetailsVC : UITableViewDataSource,UITableViewDelegate{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNyData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath)
         aCell.textLabel?.numberOfLines = 0
        aCell.textLabel?.lineBreakMode = .byWordWrapping
        aCell.textLabel?.text = arrNyData[indexPath.row].title
        aCell.detailTextLabel?.text = arrNyData[indexPath.row].published_date
        return aCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let anextController = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
        anextController.strUrl = arrNyData[indexPath.row].url
        self.navigationController?.pushViewController(anextController, animated: true)
        
        
    }
    
    
    
    
    
    
}


struct aJsonData : Codable {
    let results : [myData]
    let copyright : String?
}

struct myData : Codable {
    let title : String?
    let published_date : String?
    let url : String?
}
