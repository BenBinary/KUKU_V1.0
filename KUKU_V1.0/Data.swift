//
//  Data.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 03.01.19.
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


struct Auftrag {
    var erstellt: Data
    var anlieferung: Data
    
    var zeitAnlieferung: Int    // 1. Morgens 2. Mittags 3. Abends
    var abholung: Data
    var zeitAbholung: Int       // 1. Morgens 2. Mittags 3. Abends
    
    // STATUS: 1. bestellt 2. bezahlt 3. angeliefert 4. abgezogen 5. reklamation
    var status: Int
    var preis: Double
    var container: Container
    
    
}

struct Container {
    var groesse: String
    var deckel: Bool
    var nummer: Int?
    
}
