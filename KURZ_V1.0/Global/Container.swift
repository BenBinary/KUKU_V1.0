//
//  Container.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

struct Container : Codable {
    
    /*
     *  Nicht alle Datentypen in dieser Strukt entsprechenden dem Codable-Protokoll
     *  Deswegen werden hier einige Datentypen manuell hinzugefügt
     *
     *  These types include standard library types like String, Int, and Double; and Foundation types like Date, Data, and URL
     *
     */
    

    
    var uvv_faellig : Bool
    var uvv_letzte : Date
    var deckel : Bool
    var groesse : Int
    var coords : [CLLocationCoordinate2D] = []
    var strasse : String
    var hausnr : Int
    var plz : Int
    var stadt : String
    var adresszusatz : String
    
    /*
     Enumeration: Bei Abweichungen innerhalb des JSON-Dokuments und der hießigen Struktu
     
     Zuordnung zwischen den JSON-Namen und den Swift-Eigenschaften
     
     */
    enum CodingKeys : String, CodingKey {
        
        // Enum ist nicht ganz vollständig
        case uvv_faellig, uvv_letzte, deckel, groesse, loc_lat, loc_long, strasse, hausnr, plz, stadt, adresszusatz
        
    }

    
    
    func encode(to encoder: Encoder) throws {
        
        do {
            
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(uvv_faellig, forKey: .uvv_faellig)
            try container.encode(uvv_letzte, forKey: .uvv_letzte)
            try container.encode(deckel, forKey: .deckel)
            try container.encode(groesse, forKey: .groesse)
            try container.encode(coords[0].latitude, forKey: .loc_lat)
            try container.encode(coords[0].longitude, forKey: .loc_long)
            try container.encode(strasse, forKey: .strasse)
            try container.encode(hausnr, forKey: .hausnr)
            try container.encode(plz, forKey: .plz)
            try container.encode(stadt, forKey: .stadt)
            try container.encode(adresszusatz, forKey: .adresszusatz)
            
        } catch {
            print(error)
            throw error
        }
        
    }
    
    
    init(from decoder: Decoder) throws {
        
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            
            
            
            
        }
        
        uvv_faellig = false
        uvv_letzte = Date()
        deckel = false
        groesse = 0
        coords = [CLLocationCoordinate2DMake(CLLocationDegrees(exactly: 0.0)!, CLLocationDegrees(exactly: 0.0)!)]
        strasse = ""
        hausnr = 0
        plz = 0
        stadt = ""
        adresszusatz = ""
    }
    
    init() {
        
        uvv_faellig = false
        uvv_letzte = Date()
        deckel = false
        groesse = 0
        coords = [CLLocationCoordinate2DMake(CLLocationDegrees(exactly: 0.0)!, CLLocationDegrees(exactly: 0.0)!)]
        strasse = ""
        hausnr = 0
        plz = 0
        stadt = ""
        adresszusatz = ""
    }
    
    
}
