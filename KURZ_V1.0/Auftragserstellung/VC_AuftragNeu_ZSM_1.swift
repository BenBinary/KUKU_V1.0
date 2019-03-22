//
//  VC_AuftragNeu_ZSM_1.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 13.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import MapKit

class VC_AuftragNeu_ZSM_1: UIViewController {

    var auftrag = Auftrag()
    var standort = CLLocation()
    
    // Erste Zusammenfassung
    @IBOutlet weak var imgStoff: UIImageView?
    @IBOutlet weak var imgContainer: UIImageView?
    @IBOutlet weak var lblAnlieferung: UILabel?
    @IBOutlet weak var lblAuftragstext: UILabel?
    @IBOutlet weak var lblAbholung: UILabel?
    @IBOutlet weak var mapStandort: MKMapView!
    @IBOutlet weak var lblStrasseHsNr: UILabel?
    @IBOutlet weak var lblAdresszusatz: UILabel?
    @IBOutlet weak var lblPLZStadt: UILabel?
    @IBOutlet weak var btnBestaetigen: UIButton?
    let dateFormatter = DateFormatter()
    @IBOutlet weak var txtAuftragstext: UITextView?
    @IBOutlet weak var lblPosition: UILabel?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("View did load")
        // Setzen der Datums-Felder
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .none
        dateFormatter.locale = Locale(identifier: "de_DE")
        
   
        let auftrag = Auftrag.readAuftrag()
        
        // Setzen der An- und Abzugsvariablen
        lblAnlieferung?.text = "Anlieferung: \(auftrag.deliverDate.description)"
        lblAbholung?.text = "Abholung: \(auftrag.pickupDate.description)"
        
        // Standort - Map
        let regionRadius: CLLocationDistance = 10.0
        standort = CLLocation(latitude: auftrag.lat, longitude: auftrag.long)
        let region = MKCoordinateRegion(center: standort.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
            //mapStandort.setRegion(region, animated: false)
            //mapStandort.delegate = self
            lblPosition?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
            lblPosition?.text = "Lat: \(standort.coordinate.latitude) Long: \(standort.coordinate.longitude)"
        
            // Ausfüllen der Adressspalte
            lblStrasseHsNr?.text = "\(auftrag.strasse.description) \(auftrag.hausnr.description)"
            lblAdresszusatz?.text = "\(auftrag.adresszusatz)"
            lblPLZStadt?.text = "\(auftrag.plz) \(auftrag.stadt)"
        

    }
    
    
  
  
    @IBAction func btnAuftragstext(_ sender: UIButton) {
        
        //auftrag.auftragstext = txtAuftragstext?.text
        
    }
    
    
    @IBAction func btnBestaetigen(_ sender: UIButton) {
        
        Auftrag.saveAuftrag(auftrag)
        
    }
}


extension VC_AuftragNeu_ZSM_1: MKMapViewDelegate {
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Start")
    }
    
}
