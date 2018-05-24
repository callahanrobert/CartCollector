//
//  ViewController.swift
//  CartCollector
//
//  Created by Jackie Callahan on 5/20/18.
//  Copyright © 2018 Robert Callahan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    // postdata string in example
    var rData = [String]()
    var sData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the Firebase reference
        ref = Database.database().reference()
        
        // Retrieve the carts and listen for changes
        databaseHandle = ref?.child("Carts").observe(.childAdded, with: { (snapshot) in
        
            //let uniqueKey = snapshot.key
            //print(uniqueKey)
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let varStoreName = dictionary["StoreName"] as? String
            //let varDate = dictionary["Date"] as? String
            let varLat = dictionary["Latitude"] as? String
            let varLong = dictionary["Longitude"] as? String
            //let varURL = dictionary["UploadedImageURL"] as? String
            
            if let storeNameExist = varStoreName {
                // Append the data to the rData array
                self.rData.append(storeNameExist)
                
                //if let LatExist = varLat, let LongExist = varLong {
                let varLoc = varLat! + ", " + varLong!
                    self.sData.append(varLoc)
                //}
                
                // Reload the tableview
                self.tableView.reloadData()
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        //cell.textLabel?.text="row#\(indexPath.row)"
        //cell.detailTextLabel?.text="subtitle#\(indexPath.row)"
 
    
        cell.textLabel?.text = rData[indexPath.row] as String
        cell.detailTextLabel?.text = sData[indexPath.row] as String
        
        
        return cell
    }
    
}

