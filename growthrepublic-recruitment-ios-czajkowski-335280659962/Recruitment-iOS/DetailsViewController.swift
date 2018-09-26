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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tableViewController = navigationController?.viewControllers[0] as! TableViewController
        let selectedIndex = tableViewController.tableView.indexPathForSelectedRow?.row ?? 0
        let title = tableViewController.itemModels[selectedIndex].name
        var newTitle = ""
        for (index, letter) in title.enumerated() {
            let newLetter = index % 2 == 0 ? String(letter).lowercased() : String(letter).uppercased()
            newTitle += newLetter
        }
        
        self.title = newTitle
        self.view.backgroundColor = tableViewController.itemModels[selectedIndex].color
        
        NetworkingManager.sharedManager.delegate = self
        NetworkingManager.sharedManager.downloadItemWithID("1")
    }
    
    func downloadedItems(_ items: [ItemModel]) {
        
    }
    
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        textView.text = itemDetails.desc
    }

}
