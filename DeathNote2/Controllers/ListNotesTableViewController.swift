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
    
    let reasons : [String] = ["a horrible death: poisoned with poison", "threw up with own guts", "stumbled across a snake", "bled herself to death", "drank too much coffee", "Mourn not the passing of a life well lived, yet celebrate. Count the times your souls smiled together, reached out so invisibly yet tangibly and touched. Death is only the end of a chapter, my friend. And so as this body makes ready to return to the soil, my spirit will watch over you and live in your heart. It will bring sadness as we transform to this new way of connecting, yet this is part of living.", "there will be time\nwhen thousands of knives\nwill stab you in the throat\nand blood will fontain through your eyes\nyour craving for living will never be heard\nand only in the morning\nthey'll notice you dead"]
    
    
    var notes = [Note]() {
        //reloads data when new note is saved
        //property observer for our notes array
        
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "canvas")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        var randI : Int
        
        for i in 0...1
        {
            randI =  Int(arc4random_uniform(UInt32(reasons.count)))
            notes.append(Note(person: "bitch \(i)", reason : reasons[randI], date : Date()))
        }
        
        
      
        print("Great we are in!")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
    //let randI = Int(arc4random_uniform(5))

       let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
          let note = notes[indexPath.row]
//        cell.textLabel?.text = "\(note.deadPerson) \n Reason: \(note.deathReason) \n"
//        cell.textLabel?.sizeToFit()
//        cell.textLabel?.numberOfLines = 0
//        cell.date
       
        cell.name.text = "\(note.deadPerson)"
         cell.reason.text = "\(note.deathReason)"
         cell.reason.sizeToFit()
         cell.reason.numberOfLines = 0
         cell.date.text = note.deathDate.toString()
        
        
        designCell(cell: cell)
        return cell
    }

    

    
    func designCell(cell : UITableViewCell)
    {
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.2)
       
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayNote":
            // 1
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // 2
            let note = notes[indexPath.row]
            // 3
            let destination = segue.destination as! DisplayNoteViewController
            // 4
            destination.note = note
            
        case "addNote":
            print("create note bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
}

extension Date{

    func toString() -> String{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: self) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        return(myStringafd)
    }

}
