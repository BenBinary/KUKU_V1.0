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
    var auftragsNr : Int
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
    var strasse = ""
    var hausnr = 0
    var adresszusatz = ""
    var plz = 0
    var stadt = ""
    var lastschrift: Bool = false
    var paypal: Bool = false
    var auftragstext: String = ""
    
    
    enum CodingKeys : String, CodingKey {
        
        
        case index, auftragsNr, payed, billed, orderDate, deliverDate, pickupDate, container, strasse, hausnr, adresszusatz, plz, stadt
    }
    
    init() {
        
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        kunde = Kunde()
        
        
        // Initialisieren von non-Lazys
        orderDate = Date()
        deliverDate = Date()
        pickupDate = Date()
        container = Container()
        typ = Auftragstyp.Anlieferung
    }
    
    
    init(from decoder: Decoder) throws {
        
        do {
            
            /*
             Returns the data stored in this decoder as represented in a container keyed by the given key type.
             Required.
            */

            var container = try decoder.container(keyedBy: CodingKeys.self)
            let auftragsNr: Int = try container.decode(Int.self, forKey: .auftragsNr)
            let deliverDate: Date = try container.decode(Date.self, forKey: .deliverDate)
            let orderDate: Date = try container.decode(Date.self, forKey: .orderDate)
            let pickupDate: Date = try container.decode(Date.self, forKey: .pickupDate)
            let strasse: String = try container.decode(String.self, forKey: .strasse)
            let hausnr: Int = try container.decode(Int.self, forKey: .hausnr)
            let adresszusatz: String = try container.decode(String.self, forKey: .adresszusatz)
            let plz: Int = try container.decode(Int.self, forKey: .plz)
            let stadt: String = try container.decode(String.self, forKey: .stadt)
            
            
            self.init(kunde: Kunde(), datum: Date(), payed: false, delivered: false, deliverdate: deliverDate, pickupdate: pickupDate, strasse: strasse, hausnr: hausnr, adresszusatz: adresszusatz, plz: plz, stadt: stadt)
            
        } catch {
            print(error)
            self.init()
        }
        
    
    }

    func encode(to encoder: Encoder) throws {

        do {
            // encoding container
            var container = encoder.container(keyedBy: CodingKeys.self)
           // try container.encode(self.index, forKey: .index)
            try container.encode(auftragsNr, forKey: .auftragsNr)
            try container.encode(deliverDate, forKey: .deliverDate)
            try container.encode(orderDate, forKey: .orderDate)
            try container.encode(pickupDate, forKey: .pickupDate)
            //try container.encode(container, forKey: .container)
            try container.encode(payed, forKey: .payed)
            try container.encode(billed, forKey: .billed)
            try container.encode(strasse, forKey: .strasse)
            try container.encode(hausnr, forKey: .hausnr)
            try container.encode(adresszusatz, forKey: .adresszusatz)
            try container.encode(plz, forKey: .plz)
            try container.encode(stadt, forKey: .stadt)
            
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
        
  
        
        // Initialisieren von non-Lazys
        orderDate = Date()
        deliverDate = Date()
        pickupDate = Date()
        container = Container()
        typ = Auftragstyp.Anlieferung
        
        
    }
    
    init(kunde : Kunde, datum : Date, payed : Bool, delivered : Bool, deliverdate : Date, pickupdate : Date, strasse : String, hausnr : Int, adresszusatz : String, plz : Int, stadt : String) {
        
        // Auftragsnummer hinzufügen
        Auftrag.index = Auftrag.index + 1
        auftragsNr = Auftrag.index
        
        self.kunde = kunde
        self.orderDate = datum
        //        self.payed = false
        //        self.payed = payed
        //        self.delivered = false
        //        self.delivered = delivered
        
        
        self.deliverDate = deliverdate
        self.pickupDate = pickupdate
        self.strasse = strasse
        self.hausnr = hausnr
        self.adresszusatz = adresszusatz
        self.plz = plz
        self.stadt = stadt
        
        
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
    
    
    
    // Description-Methode
    public var description: String {
        
        
        return "\(auftragsNr) \(strasse) \(hausnr)"
        
    }
    
    
    // Persistente Datenspeicherung mit JSON
    static func saveAuftrag(_ data: Auftrag) {
        
       // if data.count == 0 { return }
        
        let enc = JSONEncoder()
        
        
        //enc.outputFormatting = .prettyPrinted
        //enc.dateEncodingStrategy = .iso8601
        
        
        if let url = docURL(for: "auftrag.json")
        {
            do {
                let jsondata = try enc.encode(data)
                try jsondata.write(to: url)
                
            } catch {
                print(error)
            }
        }
        
    }
    
    static func readAuftrag() -> Auftrag {
        
        let dec = JSONDecoder()
        
        // let documentdir = getDocumentsDirectory()
        let auftrag_file = docURL(for: "auftrag.json")
        do {
            let jsondata = try Data(contentsOf: auftrag_file!)
            
            return try dec.decode(Auftrag.self, from: jsondata)
        }
        catch {
            print(error)
        }
        
        return Auftrag()
    }
    
    
    
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    static func docURL(for filename: String) -> URL? {
        
        //sollte immer genau ein Ergebnis liefern
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let docDir = urls.first {
            return docDir.appendingPathComponent(filename)
        }
        return nil
    }
    
}

    
    
    

