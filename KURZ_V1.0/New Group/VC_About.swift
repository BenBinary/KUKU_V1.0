//
//  VC_About.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 27.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_About: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mydata = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       

    }
 

}


// Datenquelle für die TableView
extension VC_About: UITableViewDataSource {
    
    // Anzahl von Rows / Reihen / Zeilen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Hier noch die Anzahl --> dynamisch einbetten
        return 2
        
    }
    
    
    // Anzahl der Abschnitte pro Liste
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Darstellung der Tabellenzellen als Steuerelement
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "About_Cell") as! TableViewCell_About
       
        
        
        cell.lblTitel.text = "Hallo"
        cell.lblSubtitel.text = "Tschüss"
        
        return cell
        
    }

}


extension VC_About: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
        
    }
}
