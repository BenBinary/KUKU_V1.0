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
    
    @IBOutlet weak var imgStoff: UIImageView?
    @IBOutlet weak var imgContainer: UIImageView?
    @IBOutlet weak var lblAnlieferung: UILabel?
    @IBOutlet weak var lblAuftragstext: UILabel?
    @IBOutlet weak var lblAbholung: UILabel?
    @IBOutlet weak var mpStandort: MKMapView?
    @IBOutlet weak var lblStrasseHsNr: UILabel?
    @IBOutlet weak var lblAdresszusatz: UILabel?
    @IBOutlet weak var lblPLZStadt: UILabel?
    @IBOutlet weak var btnBestaetigen: UIButton?
    let dateFormatter = DateFormatter()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Setzen der Datums-Felder
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .none
        dateFormatter.locale = Locale(identifier: "de_DE")
        
        // Verbergen der Datumsfelder je nach Auftragstyp
        /*
        if (auftrag.typ == Auftragstyp.Anlieferung ) {
            lblAbholung.isHidden = true
        } else if (auftrag.typ == Auftragstyp.AnlieferungAbholung) {
            lblAbholung.text = dateFormatter.string(from: auftrag.pickupDate)
        }
        */
        
        // Einlesen / dekodieren der lokalen JSON-Datei
       // let auftrag_file = documentdir.appendingPathComponent("auftrag.json")
   
            
            let auftrag_file = Auftrag.readAuftrag()
            
            lblAnlieferung?.text = "Anlieferung: \(auftrag_file.deliverDate.description)"
            lblAbholung?.text = "Abholung: \(auftrag_file.pickupDate.description)"
        
            
            print(auftrag_file)
            print(auftrag_file.adresszusatz)
            print(auftrag_file.auftragsNr)
            print(auftrag_file.billed)
          //  print(auftrag_file.container)
            
            lblStrasseHsNr?.text = "\(auftrag_file.strasse.description) \(auftrag_file.hausnr.description)"
            lblAdresszusatz?.text = "\(auftrag_file.adresszusatz)"
            lblPLZStadt?.text = "\(auftrag_file.plz) \(auftrag_file.stadt)"
        
    }
  
 
    
}
