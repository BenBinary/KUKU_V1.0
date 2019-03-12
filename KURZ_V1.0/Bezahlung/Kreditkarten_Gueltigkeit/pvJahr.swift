//
//  pvJahr.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 11.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class pvJahr: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    let jahr = [2018, 2019, 2020, 2021, 2022]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jahr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(jahr[row])
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    

}
