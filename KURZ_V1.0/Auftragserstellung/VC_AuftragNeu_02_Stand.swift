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
        
      //  auftrag = Auftrag()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
