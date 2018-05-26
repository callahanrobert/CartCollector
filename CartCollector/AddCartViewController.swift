//
//  AddCartViewController.swift
//  CartCollector
//
//  Created by Robert Callahan on 5/21/18.
//  Copyright © 2018 Robert Callahan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddCartViewController: UIViewController {

    @IBOutlet weak var CartStoreName: UITextField!
    @IBOutlet weak var CartAddLatitude: UITextField!
    @IBOutlet weak var CartAddLongitude: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add Firebase Database Reference        
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CartAddManually(_ sender: Any) {
        //Get current timestamp
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss ZZZ"
        let DateInFormat:String = dateFormatter.string(from: todaysDate as Date)
        
        /* //Add info to database
        ref?.child("Carts").childByAutoId().setValue([
            "Located": [
                "Latitude": CartAddLatitude.text!,
                "Longitude": CartAddLongitude.text!
            ],
            "PictureRef": [
                "UploadedImageURL": "http://googlestore.com/SomeFile.jpg"
            ],
            "CartOwner":[
                "StoreName": CartStoreName.text!
            ],
            "DateFound":[
                "Date": DateInFormat
            ]
        ])
        */

        //Add info to database
         ref?.child("Carts").childByAutoId().setValue([
         "Latitude": CartAddLatitude.text!,
         "Longitude": CartAddLongitude.text!,
         "UploadedImageURL": "http://googlestore.com/SomeFile.jpg",
         "StoreName": CartStoreName.text!,
         "Date": DateInFormat
         ])
        
        //Return to calling screen
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CartCancelManually(_ sender: Any) {
        //Return to calling screen
        presentingViewController?.dismiss(animated: true, completion: nil)
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
