//
//  ContainerStandort.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 27.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation
import MapKit

class ContainerArtwork : NSObject, MKAnnotation {
    
    // Initialisieren von ein
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        
        
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    
}
