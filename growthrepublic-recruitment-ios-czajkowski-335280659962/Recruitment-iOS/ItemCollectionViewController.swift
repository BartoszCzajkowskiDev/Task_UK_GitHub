//
//  ItemCollectionViewController.swift
//  Recruitment-iOS
//
//  Created by Bartosz Czajkowski on 26/09/2018.
//  Copyright © 2018 Untitled Kingdom. All rights reserved.
//

import UIKit

class ItemCollectionViewController: UICollectionViewController, NetworkingManagerDelegate {


    var itemModels:[ItemModel] = []
    private let reuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.sharedManager.delegate = self
        NetworkingManager.sharedManager.downloadItems()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        let item = itemModels[indexPath.row]
        cell.titleLabel.text = item.name
        cell.backgroundColor = item.color
        return cell
    }

    func downloadedItems(_ items: [ItemModel]) {
        self.itemModels = items
        self.collectionView?.reloadData()
    }
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        
    }

}
