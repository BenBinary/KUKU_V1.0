//
//  VC_AuftragNeu_ZSM_2.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 21.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_AuftragNeu_ZSM_2: UIViewController {

    
    @IBOutlet weak var btnLastschrift: UIButton?
    @IBOutlet weak var btnPayPal: UIButton?
    @IBOutlet weak var lblKontoinhaber: UILabel?
    @IBOutlet weak var lblIBAN: UILabel?
    @IBOutlet weak var lblKreditinstitut: UILabel?
    
    var auftrag = Auftrag()
    var lastschrift = Lastschrift()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lblKontoinhaber?.isHidden = true
        lblIBAN?.isHidden = true
        lblKreditinstitut?.isHidden = true
        
        
    auftrag = Auftrag.readAuftrag()
        
        
        
        print("Benutzen der Lastschrift \(auftrag.lastschrift)")
        print("Benutzen von PayPal \(auftrag.paypal)")
        
        if (auftrag.paypal == true) {
            
            // Anzeigen der Labels
            lblKontoinhaber?.isHidden = false
            lblIBAN?.isHidden = false
            lblKreditinstitut?.isHidden = false
            
            btnPayPal?.isEnabled = true
            btnPayPal?.isHighlighted = true
            btnLastschrift?.isEnabled = false
            
            
            
        } else if (auftrag.lastschrift == true) {
            
            // Anzeigen der Labels
            lblKontoinhaber?.isHidden = false
            lblKontoinhaber?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lblIBAN?.isHidden = false
            lblIBAN?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lblKreditinstitut?.isHidden = false
            lblKreditinstitut?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            
            btnLastschrift?.isEnabled = true
            btnLastschrift?.isHighlighted = true
            btnLastschrift?.isSelected = true
            btnPayPal?.isEnabled = false
            
            
          //  if (Lastschrift.readLastschrift() != nil) {
                
                lastschrift = Lastschrift.readLastschrift()
                
            lblKontoinhaber?.text = "Kontoinhaber: \(lastschrift.vorname) \(lastschrift.nachname)"
                lblIBAN?.text = "IBAN: \(lastschrift.iban)"
            lblKreditinstitut?.text = "Kreditinstitut: \(lastschrift.bic)"
                
               print("Das hier ist die Lastschrift \(lastschrift)")
                
            // }
            
            
            
        }

       
    }
    


}
