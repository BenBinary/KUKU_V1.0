//
//  VC_AuftragNeu_03_Typ_Datum.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 13.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_AuftragNeu_03_Typ_Datum: UIViewController {
    
    
    var auftrag = Auftrag()
    
    @IBOutlet weak var sgAuftragsTyp: UISegmentedControl!
    
    @IBOutlet weak var dpAnlieferung: UIDatePicker!
    @IBOutlet weak var dpAbzug: UIDatePicker!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        auftrag.deliverDate = dpAnlieferung.date
        auftrag.pickupDate = dpAbzug.date
        
    }
    

    @IBAction func sgChangeAuftragsTyp(_ sender: UISegmentedControl) {

        if sgAuftragsTyp.selectedSegmentIndex == 1 {
            dpAnlieferung.isEnabled = true
            dpAbzug.isEnabled = false
        } else if sgAuftragsTyp.selectedSegmentIndex == 0 {
            dpAnlieferung.isEnabled = true
            dpAbzug.isEnabled = true
        }
        
    }
    
    @IBAction func dpChangeAnlieferung(_ sender: UIDatePicker) {
        
        auftrag.deliverDate = dpAnlieferung.date
    }
    
    @IBAction func btnWeiter(_ sender: UIButton) {
        
        // Encodieren im JSON-Format
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        
        
        if let json_auftrag = try? encoder.encode(auftrag) {
        
            print(json_auftrag)
            
            if let json_string_auftrag = String(data: json_auftrag, encoding: .utf8) {
                
                // ToDo -> Hier müssen noch die Daten gespeichert werden
                
                print(json_string_auftrag)
            }
        }
        
        
        
        print("Hallo")
        
        
    }
    
    @IBAction func dpChangeAbzug(_ sender: UIDatePicker) {
        
        auftrag.pickupDate = dpAbzug.date
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is VC_AuftragNeu_ZSM_1 {
            let vc = segue.destination as? VC_AuftragNeu_ZSM_1
            vc?.auftrag = self.auftrag
            
        }  else if segue.destination is PVC_AuftragNeu_ZSM_1 {
            let vc = segue.destination as? VC_AuftragNeu_ZSM_1
            vc?.auftrag = self.auftrag
            
        }
        
    }
    
    


}
