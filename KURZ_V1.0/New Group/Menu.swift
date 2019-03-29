//
//  Menu.swift
//  KUKU_V1.0
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Menu: Codable {
    var menu:[MenuItems]
    
    
    init() {
        menu = [MenuItems]()
    }
}

// Erste Ebene im Verzeichnis
struct MenuItems: Codable {
    var Title:String
    var Subtitle:String
    var menusubitems:[MenuSubItem]
}

// Zweite Ebene im Verzeichnis
struct MenuSubItem: Codable {
    var Title:String
    var Subtitle:String
    var Text:String
    
}
