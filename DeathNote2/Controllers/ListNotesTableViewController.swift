//
//  ListNotesTableViewController.swift
//  DeathNote2
//
//  Created by ANASTASIA on 5/10/19.
//  Copyright © 2019 ANASTASIA. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
   
    //var data : [String] = []
    
    let reasons : [String] = ["a horrible death: poisoned with poison", "threw up with own guts", "stumbled across a snake", "bled herself to death", "drank too much coffee"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "canvas")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
      
        print("Great we are in!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let randI = Int(arc4random_uniform(5))
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
        cell.textLabel?.text = "Dead person: \(indexPath.row) Reason: \(reasons[randI])"
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        

        return cell
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayNote":
            print("==============Юnote cell tapped")
        case "addNote":
            print("~~~~~~~~~~~~~~>create note bar button item tapped")
        default:
            print("***************>> unexpected segue identifier")
        }
    }
    
}
