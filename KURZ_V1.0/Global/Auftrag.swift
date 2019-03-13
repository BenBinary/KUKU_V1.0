//
//  Auftrag.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Auftrag {
    
    static var index = 0;
    let auftragsNr : Int
    var kunde : Kunde?
    var typ = Auftragstyp.Anlieferung
    lazy var orderDate : Date = Date()
    lazy var deliverDate : Date = Date()
    lazy var pickupDate : Date = Date()
    lazy var payed: Bool  = false
    lazy var billed: Bool  = false
    lazy var delivered: Bool  = false
    lazy var price: Double = 0.0
    lazy var vat = 0.0
    lazy var status = 0
    lazy var container = Container()
    lazy var stoff = Stoffe.Sperrmuell
    
    
    init() {
       
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        kunde = Kunde()
    }
    
    init(kunde : Kunde, datum : Date, payed : Bool, delivered : Bool) {
        
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        self.kunde = kunde
        self.orderDate = datum
        self.payed = payed
        self.delivered = delivered
        
        
        deliverDate = Date.init()
        billed = false
        pickupDate = Date.init()
        
        price = 0.0
        
    }
    
    
    func setContainer(for : Container) {
        
    //    self.container = Container.self
        
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
