//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, NetworkingManagerDelegate {
    
    var itemModels:[ItemModel] = []
    private let reuseIdentifier = "Cell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        NetworkingManager.sharedManager.delegate = self
        NetworkingManager.sharedManager.downloadItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        let itemModel = itemModels[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.titleLabel.text = itemModel.name
        cell.previewLabel.text = itemModel.preview
        return cell
    }
    
    func downloadedItems(_ items: [ItemModel]) {
        self.itemModels = items
        self.tableView.reloadData()
    }
    
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsFromTableViewController" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailsViewController
                destinationController.itemModel = itemModels[indexPath.row]
            }
        }
    }
    
}
