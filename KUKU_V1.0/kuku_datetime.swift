//
//  kuku_datetime.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 26.10.18.
//  Copyright © 2018 Benedikt Kurz. All rights reserved.
//

import UIKit

class kuku_datetime: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        delivery_date.setDate(Date(), animated: false)
        
        pickup_date.isEnabled = false
        pickup_date.setDate(Date()+7, animated: false)
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var WayOfService: UIPickerView!
    @IBOutlet weak var delivery_date: UIDatePicker!
    @IBOutlet weak var pickup_date: UIDatePicker!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
