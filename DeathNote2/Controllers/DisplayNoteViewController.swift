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
    let reasons : [String] = ["a horrible death: poisoned with poison", "threw up with own guts", "stumbled across a snake", "bled herself to death", "drank too much coffee", "Mourn not the passing of a life well lived, yet celebrate. Count the times your souls smiled together, reached out so invisibly yet tangibly and touched. Death is only the end of a chapter, my friend. And so as this body makes ready to return to the soil, my spirit will watch over you and live in your heart. It will bring sadness as we transform to this new way of connecting, yet this is part of living.", "there will be time\nwhen thousands of knives\nwill stab you in the throat\nand blood will fontain through your eyes\nyour craving for living will never be heard\nand only in the morning\nthey'll notice you dead", "tried to live off of Nutella and ramen noodles", "hugged a bear", "buried in freshly microwaved Hot Pockets", "the Reaper made an administrative error", "lost in the Marvel Universe", "eaten alive by Anonymous internet users"]
    
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
            
            let randI = Int(arc4random_uniform(UInt32(reasons.count)))
            //note.deathReason = reasonTextField.text ?? ""
            note.deathReason = reasons[randI]
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
