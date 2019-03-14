//
//  CustomerViewController.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

    @IBOutlet weak var txtVorname: UITextField!
    @IBOutlet weak var txtNachname: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var pvBenutzergruppe: UIPickerView!
    
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let df = DateFormatter()
        df.dateFormat = "dd-mm-yyyy"
        
       
        var kunde =  Kunde.init(vorname: "Max", nachname: "Mustermann")
        
        txtVorname.text = kunde.getVorname()
        txtNachname.text = kunde.getNachname()
        
        txtVorname.isEnabled = false
        txtNachname.isEnabled = false
        
        // Verbinden der Daten zur Picker View
        self.pvBenutzergruppe.delegate = self
        self.pvBenutzergruppe.dataSource = self
        
        
        
        // Input Daten für die Picker View
        pickerData = ["Privatkunde", "Geschäftskunde (Unternehmer i.S.d. UStG)", "Geschäftskunde (Kleinunternehmer nach § 19 UStG)", "Geschäftskunde (Kein Unternehmer i.S.d. UStG)"]
        
        
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
