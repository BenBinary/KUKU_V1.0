//
//  VC_Lastschrift_II.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 20.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_Lastschrift_II: UIViewController {

    @IBOutlet weak var txtVorname: UITextField!
    @IBOutlet weak var txtIBAN: UITextField!
    @IBOutlet weak var txtBIC: UITextField!
    @IBOutlet weak var txtNachname: UITextField!
    @IBOutlet weak var btnLastschriftVerwenden: UIButton!
    
    var lastschrift = Lastschrift()
    var auftrag = Auftrag()
    
    
    @IBAction func btnLastschriftVerwenden(_ sender: UIButton) {
        
        // Validieren der IBAN
        
        // Check BIC-Methode und checkName fehlen noch
        if (Lastschrift.checkIBAN(iban: txtIBAN.text ?? "")) == true  {
            
            lastschrift.iban = txtIBAN.text!
            lastschrift.bic = txtBIC.text ?? ""
            lastschrift.vorname = txtVorname.text!
            lastschrift.nachname = txtNachname.text!
            
            // Setzen der Eigneschaften im Auftrags-Objekt
            auftrag = Auftrag.readAuftrag()
            auftrag.lastschrift = true
            auftrag.paypal = false
            Auftrag.saveAuftrag(auftrag)
            
            
            // Persistente Speicherung der Lastschrift-Eigenschaften
            Lastschrift.saveLastschrift(lastschrift)
            
            
        } else {
            
            print("Bitte die IBAN überprüfen")
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
