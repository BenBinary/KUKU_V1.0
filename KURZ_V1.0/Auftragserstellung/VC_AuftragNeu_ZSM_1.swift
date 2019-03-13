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
    
    @IBOutlet weak var imgStoff: UIImageView!
    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var lblAnlieferung: UILabel!
    @IBOutlet weak var lblAuftragstext: UILabel!
    @IBOutlet weak var lblAbholung: UILabel!
    @IBOutlet weak var mpStandort: MKMapView!
    @IBOutlet weak var lblStrasseHsNr: UILabel!
    @IBOutlet weak var lblAdresszusatz: UILabel!
    @IBOutlet weak var lblPLZStadt: UILabel!
    @IBOutlet weak var btnBestaetigen: UIButton!
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Setzen der Datums-Felder
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .none
        dateFormatter.locale = Locale(identifier: "de_DE")
        lblAnlieferung.text = "Anlieferung: \(dateFormatter.string(from: auftrag.deliverDate))"
        
        if (auftrag.typ == Auftragstyp.Anlieferung ) {
            lblAbholung.isHidden = true
        } else if (auftrag.typ == Auftragstyp.AnlieferungAbholung) {
            lblAbholung.text = dateFormatter.string(from: auftrag.pickupDate)
        }
        
        // Setzen der Adresse
        lblStrasseHsNr.text = "\(auftrag.container.strasse) \(auftrag.container.hausnr)"
        lblAdresszusatz.text = "\(auftrag.container.adresszusatz)"
        lblPLZStadt.text = "\(auftrag.container.plz) \(auftrag.container.stadt)"
        
        
        
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
