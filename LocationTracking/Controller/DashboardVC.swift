//
//  DashboardVC.swift
//  LocationTracking
//
//  Created by Atul Upadhyay on 19/04/23.
//

import Foundation
import UIKit

class DashboardVC: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var Data = [NearByUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CoordinateData", bundle: nil), forCellReuseIdentifier: "CoordinateData")
        tableView.reloadData()
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.register(UINib(nibName: "CoordinateData", bundle: nil), forCellReuseIdentifier: "CoordinateData")
        tableView.reloadData()
        
    }
    

    
    
    
    
    @IBAction func logOutButtonClicked(_ sender: UIButton) {
        
        Global.showRootView(withIdentifier: "LoginVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CoordinateData = (tableView.dequeueReusableCell(withIdentifier: "CoordinateData") as! CoordinateData)
        let dataObj = Data[indexPath.row]
        cell.latitudeLbl.text = dataObj.lat
        cell.longitutdeLbl.text = dataObj.lng
        return cell
    }
    
    
    
}
