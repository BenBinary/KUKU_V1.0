//
//  Auftrag.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Auftrag {
    
    static let index = 0;
    let auftragsNr : Int
    var kunde : Kunde?
    var orderDate : Date
    var deliverDate : Date
    var pickupDate : Date
    var payed : Bool
    var billed : Bool
    var delivered : Bool
    var price : Double
    var vat = 0.0
    var status = 0
    
    
    init(kunde : Kunde, datum : Date, payed : Bool, delivered : Bool) {
        
        self.kunde = kunde
        self.orderDate = datum
        self.payed = payed
        self.delivered = delivered
        
        
        deliverDate = Date.init()
        billed = false
        pickupDate = Date.init()
        auftragsNr = Auftrag.index
        price = 0.0
        
    }
    
    
    mutating func setVat() {
        
        vat = price * 0.19
        
    }
    
    
    mutating func setBezahlt() {
        status = 1
    }
    
    
    func getAuftraege() -> [Auftrag] {
        var auftraege  = Array<Auftrag>()
        
        auftraege.append(Auftrag(kunde: Kunde(vorname: "Monika", nachname: "Heilmann"), datum: Date(), payed: false, delivered: false))
        auftraege.append(Auftrag(kunde: Kunde(vorname: "Phlipp", nachname: "Westhauser"), datum: Date(), payed: false, delivered: false))
        auftraege.append(Auftrag(kunde: Kunde(vorname: "Fernanda", nachname: "Beck"), datum: Date(), payed: false, delivered: false))
        
        
        return auftraege
        
        
    }
    
    
    
}
