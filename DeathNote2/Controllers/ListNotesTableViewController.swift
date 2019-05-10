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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        print("Great we are in!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
        cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
        
        return cell
    }
    
}
