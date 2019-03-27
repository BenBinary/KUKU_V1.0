//
//  TableViewCell_About.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 27.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class TableViewCell_About: UITableViewCell {
    
    
    
    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var lblSubtitel: UILabel!
    @IBOutlet weak var imageAbout: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
