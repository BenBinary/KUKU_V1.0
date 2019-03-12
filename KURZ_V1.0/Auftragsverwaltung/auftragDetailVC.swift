//
//  auftragDetailVC.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import MapKit

class auftragDetailVC: UIViewController {

    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var imgState: UIImageView!
    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var mapPlace: MKMapView!
    @IBOutlet weak var lblDatum: UILabel!
    @IBOutlet weak var lblStoff: UILabel!
    @IBOutlet weak var btnSaveChanges: UIButton!
    
    
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

}
