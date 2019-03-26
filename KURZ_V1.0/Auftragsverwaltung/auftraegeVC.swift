//
//  auftraegeVC.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit
//import Foundation

class auftraegeVC: UIViewController {
    
    
    //var auftraege: [Auftrag]
    public var mydata = Auftrag.getAuftraege()
    var hallo = "Hallo"
    
    @IBOutlet weak var table: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self       //as? UITableViewDelegate
        table.dataSource = self     //as? UITableViewDataSource
        
        
       // auftraege = Auftrag.getAuftraege()

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dest = segue.destination as? auftragDetailVC, let cell = sender as? auftragsZelle, let indexPath = table.indexPath(for: cell) {
            
            dest.data = mydata[indexPath.row]
            
        }
    }
}

extension auftraegeVC: UITableViewDataSource {
    
    // Anzahl der Abschnitte der Liste
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Anzahl der Listenelmente
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mydata.count
        
    }
    
    // Zelle wird in der Detailansicht nun angezeigt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
        // Prototypzelle erzeugen und als MyCell-Objekt verwenden
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProtoCell", for: indexPath) as! auftragsZelle
        
        
        let row = indexPath.row
        cell.lblTitel.text = mydata[row].orderDate.description
        cell.lblSubtitel.text = mydata[row].auftragsNr.description
        
        
        return cell
    
    }
    
    
    
    
    
}


extension auftraegeVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(mydata[indexPath.row])
    }
    
    
    
}

