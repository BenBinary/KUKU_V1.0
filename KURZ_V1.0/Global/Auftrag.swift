//
//  Auftrag.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Auftrag : Codable {
    
    
    /*
     *  Nicht alle Datentypen in dieser Strukt entsprechenden dem Codable-Protokoll
     *  Deswegen werden hier einige Datentypen manuell hinzugefügt
     *
     *  These types include standard library types like String, Int, and Double; and Foundation types like Date, Data, and URL
     *
     */
    
    static var index = 0;
    var typ : Auftragstyp
    let auftragsNr : Int
    var kunde : Kunde?
    var orderDate : Date
    var deliverDate : Date
    var pickupDate : Date
    var payed: Bool  = false
    var billed: Bool  = false
    lazy var delivered: Bool  = false
    lazy var price: Double = 0.0
    lazy var vat = 0.0
    lazy var status = 0
    var container : Container
    lazy var stoff = Stoffe.Sperrmuell
    
    
    enum CodingKeys : String, CodingKey {
        
        
        case index, auftragsNr, payed, billed, orderDate, deliverDate, pickupDate, container
    }
    
    init() {
        
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        kunde = Kunde()
        
        
        // Initialisieren
        orderDate = Date()
        deliverDate = Date()
        pickupDate = Date()
        container = Container()
        
        typ = Auftragstyp.Anlieferung
    }
    
    init(from decoder: Decoder) throws {
        
        do {
//
//            var container = try decoder.container(keyedBy: CodingKeys.self)
//            try container.enc
            
            
        }
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        kunde = Kunde()
        
        
        // Initialisieren
        orderDate = Date()
        deliverDate = Date()
        pickupDate = Date()
        container = Container()
        typ = Auftragstyp.Anlieferung
    }

    func encode(to encoder: Encoder) throws {

        do {
            var container = encoder.container(keyedBy: CodingKeys.self)
           // try container.encode(self.index, forKey: .index)
            try container.encode(auftragsNr, forKey: .auftragsNr)
            try container.encode(deliverDate, forKey: .deliverDate)
            try container.encode(orderDate, forKey: .orderDate)
            try container.encode(pickupDate, forKey: .pickupDate)
            //try container.encode(container, forKey: .container)
            try container.encode(payed, forKey: .payed)
            try container.encode(billed, forKey: .billed)
            try container.encode(billed, forKey: .billed)
            
        } catch {
            print(error)
            throw error
            
        }
        


    }
    
    init(kunde : Kunde, datum : Date, payed : Bool, delivered : Bool) {
        
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        self.kunde = kunde
        self.orderDate = datum
        //        self.payed = false
        //        self.payed = payed
        //        self.delivered = false
        //        self.delivered = delivered
        
        
        deliverDate = Date.init()
        //        billed = false
        pickupDate = Date.init()
        
        
        typ = Auftragstyp.Anlieferung
        container = Container()
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
