//
//  ViewController.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 04.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    @IBOutlet weak var profil: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profil.setTitle("Max", for: .normal)
  
    }
    
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
