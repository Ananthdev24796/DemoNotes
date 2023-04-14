//
//  EditVIewController.swift
//  DemoNotes
//
//  Created by Ananth Nair on 05/04/23.
//

import UIKit
import FirebaseDatabase
import Firebase

class EditViewController : UIViewController {
    
    
    var note : NoteModel?
    var db = Firestore.firestore()
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let note = note else { return }
        
        titleTextField.text = note.title
        descriptionTextField.text = note.description
        
        
    }
    
    
    @IBAction func deletebuttonTapped(_ sender: Any) {
        guard let note = note else { return }
        db.collection("NotesApp").document(note.id).delete(){ err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                self.navigationController?.popViewController(animated: true)
                print("Document successfully removed!")
            }
        }
    }
    
    

    
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        guard let note = note else { return }
        guard let title = titleTextField.text else { return }
        guard let description = descriptionTextField.text else { return }
        db.collection("NotesApp").document(note.id).setData(["Title" : title, "Description" : description ,"id": note.id]){ err in
             if let err = err {
             print("Error in updatw document: \(err)")
             } else {
               self.navigationController?.popViewController(animated: true)
               print("Document successfully Updated!")
             }
        }
        
    }
    
}
