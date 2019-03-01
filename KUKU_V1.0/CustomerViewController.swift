//
//  CustomerViewController.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    @IBOutlet weak var txtVorname: UITextField!
    @IBOutlet weak var txtNachname: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let df = DateFormatter()
        df.dateFormat = "dd-mm-yyyy"
        
        
        var kunde =  mKunde.init(vorname: "Max", nachname: "Mustermann")
        
        txtVorname.text = kunde.getVorname()
        txtNachname.text = kunde.getNachname()
        
        txtVorname.isEnabled = false
        txtNachname.isEnabled = false
        
        
        
        //txtVorname.text = mKunde.
        
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
