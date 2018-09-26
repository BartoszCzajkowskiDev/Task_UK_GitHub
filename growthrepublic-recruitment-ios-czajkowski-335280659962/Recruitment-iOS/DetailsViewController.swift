//
//  DetailsViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, NetworkingManagerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var itemModel: ItemModel?
    
    override func viewDidLoad() {
        NetworkingManager.sharedManager.delegate = self
        
        // added:
        guard let id = itemModel?.id else{
            return
        }
        NetworkingManager.sharedManager.downloadItemWithID(id)
        
        if let item = itemModel{
            let title = item.name
            var newTitle = ""
            for (index, letter) in title.enumerated() {
                let newLetter = index % 2 == 0 ? String(letter).lowercased() : String(letter).uppercased()
                newTitle += newLetter
            }
            titleLabel.text = newTitle
            self.view.backgroundColor = item.color
        }
    }
    
    func downloadedItems(_ items: [ItemModel]) {
        
    }
    
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        textView.text = itemDetails.desc
    }

}
