//
//  VC_About.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 27.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_About_1: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mydata = [[String]]()
    var menu = [MenuItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        var decoder = JSONDecoder()
        
        if let url = Bundle.main.url(forResource: "AboutDaten", withExtension: "json"){
        
            if let data = try? Data(contentsOf: url) {
                
                if let jsonData = try? decoder.decode(Menu.self, from: data) {
                    
                    
                    print(jsonData.menu[0].Title)
                    print(jsonData.menu[1].Title)
                    
                    self.menu = jsonData.menu
                    
                    print(self.menu[0].Title)
                    print(self.menu[2].Title)
                    
                } else { print("keine Dekodierung") }
                
                
            } else { print("keine Daten")}
            
            
        } else { print("keine URL")}
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       

        
        
        if segue.destination is VC_About_2 {
            
            let dest = segue.destination as! VC_About_2
            
            
            //dest.menusubitems = menu?[0].menusubitems
            
            
        }
        
        
    }
 

}


// Datenquelle für die TableView
extension VC_About_1: UITableViewDataSource {
    
    // Anzahl von Rows / Reihen / Zeilen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Hier noch die Anzahl --> dynamisch einbetten
        return menu.count
        
    }
    
    
    // Anzahl der Abschnitte pro Liste
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Darstellung der Tabellenzellen als Steuerelement
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "About_Cell") as! TableViewCell_About

        var row = indexPath.row
        print(row)
        
        
        cell.lblTitel.text = menu[row ?? 0].Title
        cell.lblSubtitel.text = menu[row ?? 0].Subtitle
        
        return cell
        
    }

}


extension VC_About_1: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
        
    }
}
