//
//  Container.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation
import CoreLocation


struct Container {
    
    var uvv_faellig : Bool
    var uvv_letzte : Date
    var deckel : Bool
    var groesse : Int
    var coords : [CLLocationCoordinate2D] = []
    
    
    init() {
        
        uvv_faellig = false
        uvv_letzte = Date()
        deckel = false
        groesse = 0
        coords = [CLLocationCoordinate2DMake(CLLocationDegrees(exactly: 0.0)!, CLLocationDegrees(exactly: 0.0)!)]
    }
    
    
}
