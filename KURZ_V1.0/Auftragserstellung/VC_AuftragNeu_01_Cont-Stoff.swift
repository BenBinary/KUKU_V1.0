

//
//  gps_con_stof_VC.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 17.01.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_AuftragNeu_01_ContStoff: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    var containerWahl = ContainerTyp.none
    
    @IBOutlet weak var btnContainer: UIButton!
    @IBOutlet weak var btnStoff: UIButton!
    
    
    var container = Container()
    
    
    var auftrag = Auftrag()

    override func viewDidLoad() {
        super.viewDidLoad()

        
       // container = btnContainer.imageView.
        
        
        auftrag.kunde?.nachname = "Kurz"
        auftrag.kunde?.vorname = "Benedikt"
        
        auftrag.container.plz = 71723
        auftrag.container.stadt = "Großbottwar"
        auftrag.container.hausnr = 42
        auftrag.container.strasse = "Kantstr"
        
        auftrag.hausnr = 40
        auftrag.adresszusatz = "hinterer Eingang"
        auftrag.strasse = "Tremoniastr"
        auftrag.plz = 44137
        auftrag.stadt = "Dortmund"
        
        print(containerWahl)
        
        btnContainer.setImage(UIImage(named: containerWahl.rawValue), for: .normal)
        
    }
    

    
    // POPUPS
    // um Popup zu initiieren
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dest = segue.destination as? PopupViewController, let popPC = dest.popoverPresentationController {
            popPC.delegate = self
        }
        
        if segue.destination is VC_AuftragNeu_02_Stand {
            let vc = segue.destination as? VC_AuftragNeu_02_Stand
            vc?.auftrag = auftrag
        }
        
        
        
        if let dest = segue.destination as? VC_AuftragNeu_02_Stand {
           
            //dest.auftrag =
            
        }
 
    }
    
    // Damit Popups als solche angezeigt werden
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }

}
