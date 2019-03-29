//
//  VC_About_2.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class VC_About_2: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var menusubitems: [MenuSubItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        
       //menusubitems = [MenuSubItem]()
    }
    


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        
        var row = tableView.indexPathForSelectedRow?.row
        
        if (segue.destination is VC_About_3) {
        
            var dest = segue.destination as? VC_About_3
            dest?.text = menusubitems[row ?? 0].Text
            dest?.title = menusubitems[row ?? 0].Title
            let backItem = UIBarButtonItem()
            backItem.title = menusubitems[row ?? 0].Title
            dest?.navigationItem.backBarButtonItem = backItem
        }
        
        
    }
 

}


extension VC_About_2: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusubitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "About_Cell_2") as! TableViewCell_About_2
        
        let row = indexPath.row
        
        
        cell.lblTitel.text = menusubitems[row].Title
        cell.lblSubtitel.text = menusubitems[row].Subtitle
        return cell
        
        
    }
    
    
    
    
}

extension VC_About_2: UITableViewDelegate {
    
}
