//
//  auftraegeVC.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
import Foundation

class auftraegeVC: UIViewController {
    
 
    
    @IBOutlet weak var table: UITableView!

    var mydata : [Auftrag] = [Auftrag(kunde: Kunde(vorname: "a", nachname: "b"), datum: Date(), payed: false, delivered: false), Auftrag(kunde: Kunde(vorname: "c", nachname: "d"), datum: Date(), payed: false, delivered: false)]
    
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        
    }
    
 
    


}

extension ViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
        // Prototypzelle erzeugen und als MyCell-Objekt verwenden
        let cell = tableView.dequeueReusableCell(withIdentifier: "auftragsZelle", for: indexPath) as! auftragsZelle
        
        
        let row = (indexPath as NSIndexPath).row
        
        
        
        
        
        return cell
    
    }
    
    
    
    
    
}
