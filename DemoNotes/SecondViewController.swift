//
//  SecondViewController.swift
//  DemoNotes
//
//  Created by Ananth Nair on 03/04/23.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class SecondViewController : UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
  
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func addPost(_ sender: Any) {

        let title = titleTextField.text
        let description = descriptionTextField.text

        //Adding a document
        // db.collection("NewNote").addDocument(data: ["dailyreport" : "April", "type" : "status"])
        // Getting documnet id

        let newDocument = db.collection("NotesApp").document()
        newDocument.setData(["Title" : title , "Description" : description,"id":newDocument.documentID])

        //Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)


    }
    
//    @IBAction func addButtonTapped(_ sender: Any) {
//        let newDocument = db.collection("NotesApp").document()
//        newDocument.setData(["Title" : title , "Description" : description,"id":newDocument.documentID])
//        //Dismiss the popover
//        presentingViewController?.dismiss(animated: true, completion: nil)
//    }
}
