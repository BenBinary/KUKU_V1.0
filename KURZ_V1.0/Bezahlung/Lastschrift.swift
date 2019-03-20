//
//  Lastschrift.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 20.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Lastschrift : Codable {
    
    var iban: String = ""
    var bic: String = ""
    var vorname: String = ""
    var nachname: String = ""
    var verwendungszweck: String = ""
    
    
    init() {
        
    }
    
    init(iban : String, bic : String, vorname : String, nachname : String, verwendungszweck : String) {
        
        self.iban = iban
        self.bic = bic
        self.vorname = vorname
        self.nachname = nachname
        self.verwendungszweck = verwendungszweck
        
    }
    
    
    // Validieren der IBAN --> noch zu prüfen
    static func checkIBAN(iban : String) -> Bool {
        
        var a = iban.utf8.map{ $0 }
        while a.count < 4 {
            a.append(0)
        }
        let b = a[4..<a.count] + a[0..<4]
        let c = b.reduce(0) { (r, u) -> Int in
            let i = Int(u)
            return i > 64 ? (100 * r + i - 55) % 97: (10 * r + i - 48) % 97
        }
        
        return c == 1 ? true : false
        
    }
    
    
    // Speichern des Objekts als JSON-Objekt
    static func saveLastschrift(_ data: Lastschrift) {
        
        let enc = JSONEncoder()
        
        
        //enc.outputFormatting = .prettyPrinted
        //enc.dateEncodingStrategy = .iso8601
        
        
        if let url = docURL(for: "lastschrift.json")
        {
            do {
                let jsondata = try enc.encode(data)
                try jsondata.write(to: url)
                
            } catch {
                print(error)
            }
        }
        
    }
    
    
    // Öffnen der Daten aus einer JSON-Datei
    static func readLastschrift() -> Lastschrift {
        
        let dec = JSONDecoder()
        
        // let documentdir = getDocumentsDirectory()
        let lastschrift = docURL(for: "lastschrift.json")
        do {
            let jsondata = try Data(contentsOf: lastschrift!)
            
            return try dec.decode(Lastschrift.self, from: jsondata)
        }
        catch {
            print(error)
        }
        
        return Lastschrift()
    }
    
    
    // Rückgabe des URLs für das Dokumentenverzeichnis
    static func docURL(for filename: String) -> URL? {
        
        //sollte immer genau ein Ergebnis liefern
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let docDir = urls.first {
            return docDir.appendingPathComponent(filename)
        }
        return nil
    }
    
    
    
}
