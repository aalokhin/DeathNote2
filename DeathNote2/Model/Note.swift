//
//  Note.swift
//  DeathNote2
//
//  Created by ANASTASIA on 5/11/19.
//  Copyright © 2019 ANASTASIA. All rights reserved.
//

import Foundation

class Note {
    
    // MARK: - Properties
    
    var deadPerson = ""
    var deathReason = ""
    var deathDate = Date()
    
    init(person : String, reason : String, date : Date){
        self.deadPerson = person
        self.deathReason = reason
        self.deathDate = date
    }
    init (){
        
    }
    
    
}
