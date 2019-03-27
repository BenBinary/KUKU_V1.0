//
//  auftragDetailVC.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import MapKit

class auftragDetailVC: UIViewController {
    
    let regionRadius: CLLocationDistance = 1000
    var data:Auftrag!

    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var imgState: UIImageView!
    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var mapPlace: MKMapView!
    @IBOutlet weak var lblDatum: UILabel!
    @IBOutlet weak var lblStoff: UILabel!
    @IBOutlet weak var btnSaveChanges: UIButton!
    @IBOutlet weak var lblKunde: UILabel!
    @IBOutlet weak var lblStandort: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        lblTitel.text = "Auftragsnummer \(data.auftragsNr.description)"
        lblDatum.text = data.deliverDate.description
        lblStoff.text = data.stoff.rawValue
        
        imgContainer.image = UIImage(named: data.containerTyp.rawValue)
        
        if let cust = data.kunde {
            
            lblKunde.text = "Kunde: \(cust.getVorname()) \(cust.getNachname())"
        }
        
        // Standort Container
        let initialLocation = CLLocation(latitude: data.lat, longitude: data.long)
        
        let initialLocation_2 = CLLocationCoordinate2D(latitude: data.lat, longitude: data.long)
        
        centerMapOnLocation(location: initialLocation)
        
        let artwork = ContainerArtwork(title: data.containerTyp.rawValue, locationName: "T##String", discipline: "Container", coordinate: initialLocation_2)
        
        
        mapPlace.addAnnotation(artwork)
        
        lblStandort.text = "\(data.lat) \(data.long)"
    
        
    }
    
    func centerMapOnLocation(location: CLLocation)  {
        
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapPlace.setRegion(coordinateRegion, animated: true)
        
        
    }
    

}
