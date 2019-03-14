//
//  PopupContainerViewController.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class PopupContainerViewController: PopupViewController {

    
    var ContainerSet = ContainerTyp.none
    var auftrag = Auftrag()
    
    // Props
    @IBOutlet weak var slidDeckel: UISwitch!
    @IBOutlet weak var btn5QM: UIButton!
    @IBOutlet weak var btn7QM: UIButton!
    @IBOutlet weak var btn10QM: UIButton!
    @IBOutlet weak var btn20QM: UIButton!
    @IBOutlet weak var btn40QM: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func buttonTouch(_ sender: UIButton) {
        
        
        
        
        if (sender.title(for: .normal) == "20") {
            ContainerSet = ContainerTyp.ABR_20
        } else if (sender.title(for: .normal) == "40") {
            ContainerSet = ContainerTyp.ABR_40
        } else if (slidDeckel.isOn == true) {
            
            if (sender.title(for: .normal) == "5") {
                ContainerSet = ContainerTyp.ABS_5_DECKEL
            } else if (sender.title(for: .normal) == "7") {
                ContainerSet = ContainerTyp.ABS_7_DECKEL
            } else if (sender.title(for: .normal) == "10") {
                ContainerSet = ContainerTyp.ABS_10_DECKEL
            }
            
        } else if (slidDeckel.isOn == false) {
            
            if (sender.title(for: .normal) == "5") {
                ContainerSet = ContainerTyp.ABS_5_OFFEN
            } else if (sender.title(for: .normal) == "7") {
                ContainerSet = ContainerTyp.ABS_7_OFFEN
            } else if (sender.title(for: .normal) == "10") {
                ContainerSet = ContainerTyp.ABS_10_OFFEN
            }
        }
    }
    
    
    @IBAction func sliderDeckelChanged(_ sender: UISwitch) {
        
        // mit Deckel
        if (slidDeckel.isOn) {
   
            btn5QM.setImage(UIImage(named: "ABS_5QM_DECKEL"), for: UIControl.State.normal )
            btn7QM.setImage(UIImage(named: "ABS_7QM_DECKEL"), for: UIControl.State.normal )
            btn10QM.setImage(UIImage(named: "ABS_10QM_DECKEL"), for: UIControl.State.normal )

            btn20QM.isEnabled = false
            btn40QM.isEnabled = false
            
        }
            
        // ohne Deckel
        else if (slidDeckel.isOn == false) {
            
            btn5QM.setImage(UIImage(named: "ABS_5QM_OFFEN"), for: UIControl.State.normal )
            btn7QM.setImage(UIImage(named: "ABS_7QM_OFFEN"), for: UIControl.State.normal )
            btn10QM.setImage(UIImage(named: "ABS_10QM_OFFEN"), for: UIControl.State.normal )
            
            btn20QM.isEnabled = true
            btn40QM.isEnabled = true
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.destination is VC_AuftragNeu_01_ContStoff) {
            
            let vc = segue.destination as? VC_AuftragNeu_01_ContStoff
            
            
            vc?.containerWahl = ContainerSet
            
        }
        
    }
    

}
