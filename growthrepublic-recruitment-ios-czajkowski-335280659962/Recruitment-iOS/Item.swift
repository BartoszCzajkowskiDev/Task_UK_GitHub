//
//  Item.swift
//  Recruitment-iOS
//
//  Created by Bartosz Czajkowski on 26/09/2018.
//  Copyright © 2018 Untitled Kingdom. All rights reserved.
//

import UIKit

class Item {
    
    var name:String
    var color:UIColor
    var id:String

    init(name: String, color: UIColor, id: String) {
        self.name = name
        self.color = color
        self.id = id
    }
}
