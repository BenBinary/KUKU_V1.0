//
//  VC_Bezahlung.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 11.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_Bezahlung: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var btnPayPal: UILabel!
    @IBOutlet weak var viewPayPal: UIView!
    @IBOutlet weak var viewLastschrift: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLastschrift.isHidden = true
        viewPayPal.isHidden = false
    }
    
    @IBAction func btnLastschrift(_ sender: UIButton) {
        viewLastschrift.isHidden = false
        viewPayPal.isHidden = true
        
        print("Lastschrift")
        
        
    }
    
    @IBAction func btnPayPal(_ sender: UIButton) {
        
        //viewBezahlung = nibBundle.
        viewLastschrift.isHidden = true
        viewPayPal.isHidden = false
       
        print("PayPal")
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PopupViewController, let popPC = dest.popoverPresentationController {
            popPC.delegate = self
        }
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
        
    }


}
