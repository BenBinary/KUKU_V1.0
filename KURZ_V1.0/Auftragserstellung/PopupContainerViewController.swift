//
//  PopupContainerViewController.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class PopupContainerViewController: PopupViewController {

    
    // Props
    @IBOutlet weak var slidDeckel: UISwitch!
    @IBOutlet weak var btn5QM: UIButton!
    @IBOutlet weak var btn7QM: UIButton!
    @IBOutlet weak var btn10QM: UIButton!
    @IBOutlet weak var btn20QM: UIButton!
    @IBOutlet weak var btn40QM: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func sliderDeckelChanged(_ sender: UISwitch) {
        
        // mit Deckel
        if (slidDeckel.isOn) {
   
            btn5QM.setImage(UIImage(named: "ABS_5QM_DECKEL"), for: UIControl.State.normal )
            btn7QM.setImage(UIImage(named: "ABS_7QM_DECKEL"), for: UIControl.State.normal )
            btn10QM.setImage(UIImage(named: "ABS_10QM_DECKEL"), for: UIControl.State.normal )
           // btn20QM.setImage(UIImage(named: "ABS_7QM_DECKEL"), for: UIControl.State.normal )
            //btn40QM.setImage(UIImage(named: "ABS_7QM_DECKEL"), for: UIControl.State.normal )
            
        }
        // ohne Deckel
        else if (slidDeckel.isOn == false) {
            
            btn5QM.setImage(UIImage(named: "ABS_5QM_OFFEN"), for: UIControl.State.normal )
            btn7QM.setImage(UIImage(named: "ABS_7QM_OFFEN"), for: UIControl.State.normal )
            btn10QM.setImage(UIImage(named: "ABS_10QM_OFFEN"), for: UIControl.State.normal )
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    

}
