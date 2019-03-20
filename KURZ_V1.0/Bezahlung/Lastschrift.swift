//
//  Lastschrift.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 20.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Lastschrift : Codable {
    
    let iban : String
    let bic : String
    let vorname : String
    let nachname : String
    let verwendungszweck : String
    
    
    init(iban : String, bic : String, vorname : String, nachname : String, verwendungszweck : String) {
        
        self.iban = iban
        self.bic = bic
        self.vorname = vorname
        self.nachname = nachname
        self.verwendungszweck = verwendungszweck
        
    }
    
}
