//
//  VC_AuftragNeu_02_Stand.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 12.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import MapKit

class VC_AuftragNeu_02_Stand: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    // Attribute
    
    var auftrag = Auftrag()
    
    @IBOutlet weak var mapStandort: MKMapView!
    @IBOutlet weak var swAdresseBearbeiten: UISwitch!
    @IBOutlet weak var txtStrasse: UITextField!
    @IBOutlet weak var txtHausNr: UITextField!
    @IBOutlet weak var txtPLZ: UITextField!
    @IBOutlet weak var txtStadt: UITextField!
    
    @IBOutlet weak var lblKoordinaten: UILabel!
    @IBOutlet weak var txtAdresszusatz: UITextField!
    
    
    // Standorte hinzufügen
    var locmgr:CLLocationManager!               // Location Manager
    var coords:[CLLocationCoordinate2D] = []    // Array für Posiononen
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setzen des aktuellen Standortes
        mapStandort.showsUserLocation = true
        auftrag.container.coords = [mapStandort.userLocation.coordinate]
        
        //Ausfüllen der Lieferadresse
        txtStadt.text = auftrag.container.stadt
        txtAdresszusatz.text = auftrag.container.adresszusatz
        txtHausNr.text = String(auftrag.container.hausnr)
        txtPLZ.text = String(auftrag.container.plz)
        txtStrasse.text = auftrag.container.strasse

        // Location-Manager initialisieren
        locmgr = CLLocationManager()
        locmgr.delegate = self
        locmgr.desiredAccuracy = kCLLocationAccuracyBest
        locmgr.requestAlwaysAuthorization()
        locmgr.startUpdatingLocation()
        mapStandort.delegate = self
        

        lblKoordinaten.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        for loc in locations {
            
            lblKoordinaten.text = "Long: \(String(format: "%.5f", loc.coordinate.longitude))°  Lat: \(String(format: "%.5f", loc.coordinate.latitude))°"
            
            // Kartenausschnitt setzen
            let span = 0.09
            let reg = MKCoordinateRegion(center: mapStandort.userLocation.coordinate, latitudinalMeters: span, longitudinalMeters: span)
            mapStandort.setRegion(reg, animated: false)
            
            // Hinzufügen der Koordinaten zum Array
            coords.append(loc.coordinate)
            
            // Eingabe der Koordinaten sobald es fünf davon gibt
            if (coords.count > 10) {
                
                
                auftrag.long = loc.coordinate.longitude
                auftrag.lat = loc.coordinate.latitude
                
                break
                
            }
            
        }
        
    }
    
    
    // Sobald Switch geändert wird
    @IBAction func swChanged(_ sender: UISwitch) {
        
        if swAdresseBearbeiten.isOn {
            txtPLZ.isEnabled = true
            txtStadt.isEnabled = true
            txtHausNr.isEnabled = true
            txtStadt.isEnabled = true
        } else if swAdresseBearbeiten.isOn == false {
            txtPLZ.isEnabled = false
            txtStadt.isEnabled = false
            txtHausNr.isEnabled = false
            txtStadt.isEnabled = false
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        if let vc = segue.destination as? VC_AuftragNeu_03_Typ_Datum {
            vc.auftrag = self.auftrag
        }
        
    }
    

}
