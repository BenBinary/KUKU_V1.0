//
//  auftragsZelle.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 01.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import UIKit

class auftragsZelle: UITableViewCell {

    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var lblSubtitel: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
