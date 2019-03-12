//
//  VC_Lastschrift.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 11.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_Lastschrift: PopupViewController {

    @IBOutlet weak var sldKontoinhaber: UISwitch!
    @IBOutlet weak var txtVorname: UITextField!
    @IBOutlet weak var txtNachname: UITextField!
    @IBOutlet weak var txtIBAN: UITextField!
    @IBOutlet weak var txtBIC: UITextField!
    @IBOutlet weak var txtBank: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeKontoinhaber(_ sender: UISwitch) {
        
        if sldKontoinhaber.isOn {
            txtVorname.isEnabled=false
            txtNachname.isEnabled=false
        } else if sldKontoinhaber.isOn == false {

            txtVorname.isEnabled=true
            txtNachname.isEnabled=true
        }
        
        
    }
    @IBAction func btnSetLastschrift(_ sender: UIButton) {
        
        var iban = txtIBAN.text
        
        // ggf Leerzeichen ersetzen
        iban?.replacingOccurrences(of: " ", with: "")
        
        
        // Prüfen der IBAN
        if (iban != nil), (txtIBAN.text?.count == 20) {
            
        }
        
        
    }
    


}
