//
//  About.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 27.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct About {
    
    
    var data = [[String]]()
    
    
    init() {
    
        data[0][0] = "Wie funktioniert das Entsorgen mit KURZ?"
        data[0][1] = "Wer kann Container bestellen?"
        data[0][2] = "Unser Entsorgungsangebot wendet sich an Haushalte und Gewerbebetriebe. Klassische Abfälle, die Haushalte über den KURZ Containerdienst entsorgen, sind Abfälle aus Renovierung, Bau und Gartengestaltung sowie Haushaltsauflösung und Entrümpelung.         Bei Abfällen, die aus der laufenden Lebenshaltung stammen und nicht verwertet werden können, müssen Haushalte die sogenannte Überlassungspflicht an die öffentlich-rechtliche Müllabfuhr beachten. Für diese Abfälle muss die schwarze Restmülltonne verwendet werden. Gewerbebetriebe können unseren Containerdienst im Rahmen der Gewerbeabfallverordnung uneingeschränkt nutzen. KURZ ist zertifizierter Entsorgungsfachbetrieb und steht für eine vorschriftsmäßige Entsorgung mit vollständiger Dokumentation."
        
        
        
        
    }
    
    
    func getDaten() -> [[String]] {
        
        return data
        
    }
    
}
