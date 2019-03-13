//
//  VC_AuftragNeu_02_Stand.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 12.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import MapKit

class VC_AuftragNeu_02_Stand: UIViewController {

    
    // Attribute
    
    var auftrag = Auftrag()
    
    @IBOutlet weak var mapStandort: MKMapView!
    @IBOutlet weak var swAdresseBearbeiten: UISwitch!
    @IBOutlet weak var txtStrasse: UITextField!
    @IBOutlet weak var txtHausNr: UITextField!
    @IBOutlet weak var txtPLZ: UITextField!
    @IBOutlet weak var txtStadt: UITextField!
    
    @IBOutlet weak var txtAdresszusatz: UITextField!
    
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
