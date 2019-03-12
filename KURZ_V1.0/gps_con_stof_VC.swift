

//
//  gps_con_stof_VC.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class gps_con_stof_VC: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // POPUPS
    // um Popup zu initiieren
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dest = segue.destination as? PopupViewController, let popPC = dest.popoverPresentationController {
            popPC.delegate = self
        }
    }
    
    // Damit Popups als solche angezeigt werden
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }

}
