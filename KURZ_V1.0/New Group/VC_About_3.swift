//
//  VC_About_3.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 29.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_About_3: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    var text: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.textView.text = text
        
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
