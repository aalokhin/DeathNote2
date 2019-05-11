//
//  DisplayNoteViewController.swift
//  DeathNote2
//
//  Created by ANASTASIA on 5/10/19.
//  Copyright © 2019 ANASTASIA. All rights reserved.
//

import Foundation

import UIKit

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var reasonTextField: UITextView!
    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let backgroundImage = UIImage(named: "canvas")
        //let imageView = UIImageView(image: backgroundImage)
        //self.view.backgroundView = imageView
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            // 2
            nameTextField.text = note.deadPerson
            reasonTextField.text = note.deathReason
        } else {
            // 3
            nameTextField.text = ""
            reasonTextField.text = ""
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier,
            let destination = segue.destination as? ListNotesTableViewController
            else { return }
        

        
        switch identifier {
        case "save" where note != nil:
            note?.deadPerson = nameTextField.text ?? ""
            note?.deathReason = reasonTextField.text ?? ""
            destination.tableView.reloadData()
        // 3
        case "save" where note == nil:
            let note = Note()
            note.deadPerson = nameTextField.text ?? ""
            note.deathReason = reasonTextField.text ?? ""
            note.deathDate = Date()
            if (!note.deadPerson.isEmpty){
                let destination = segue.destination as! ListNotesTableViewController
                destination.notes.append(note)
            }
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let identifier = segue.identifier else { return }
//
//        switch identifier {
//        case "save":
//            print("save bar button item tapped")
//
//        case "cancel":
//            print("cancel bar button item tapped")
//
//        default:
//            print("unexpected segue identifier")
//        }
//    }
}
