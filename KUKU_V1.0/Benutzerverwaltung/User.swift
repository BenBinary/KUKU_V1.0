//
//  User.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct User {
    
    
    
    // Name
    var vorname: String
    var nachname: String
    
    // Adresse
    var strasse: String?
    var hausnr: Int?
    var ort: String?
    var plz: Int?
    
    // Array mit allen Aufträgen des Kundens
    var auftraege: [Auftrag]?
    
    init() {
        vorname = "Max"
        nachname = "Mustermann"
    }
    
    
    init(nachname: String, vorname: String) {
        self.nachname = nachname
        self.vorname = vorname
    }
}
