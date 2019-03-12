//
//  mKunde.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Kunde {
    var vorname : String
    var nachname : String
   // var geburtstadatum : Date
    
    
    init (vorname : String, nachname : String) {
        
        self.vorname = vorname
        self.nachname = nachname
        
    }
    
    
    
    func getVorname() -> String {
        return vorname
    }
    
    func getNachname() -> String {
        return nachname
    }

}
