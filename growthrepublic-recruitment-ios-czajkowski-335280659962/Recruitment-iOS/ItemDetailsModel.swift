//
//  ItemDetailsModel.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemDetailsModel: ItemModel {

    var desc:String
    
    init(name: String, color: UIColor, desc:String) {
        self.desc = desc
        super.init(name: name, color: color)
    }
    
}
