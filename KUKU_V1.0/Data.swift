//
//  Data.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 03.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation




struct Auftrag {
    var erstellt: Data
    var anlieferung: Data
    
    var zeitAnlieferung: Int    // 1. Morgens 2. Mittags 3. Abends
    var abholung: Data
    var zeitAbholung: Int       // 1. Morgens 2. Mittags 3. Abends
    
    // STATUS: 1. bestellt 2. bezahlt 3. angeliefert 4. abgezogen 5. reklamation
    var status: Int
    var preis: Double
   // var container: Container
    
    
}

/*
struct Container {
    var groesse: String
    var deckel: Bool
    var nummer: Int?
    
}
*/
