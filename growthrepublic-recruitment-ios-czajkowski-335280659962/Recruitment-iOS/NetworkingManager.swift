//
//  NetworkingManager.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

protocol NetworkingManagerDelegate {
    
    func downloadedItems(_ items:[ItemModel])
    func downloadedItemDetails(_ itemDetails:ItemDetailsModel)
    
}

class NetworkingManager: NSObject {

    static var sharedManager = NetworkingManager()
    
    var delegate:NetworkingManagerDelegate?
    
    func downloadItems() {
        request(filename: "Items.json") { dictionary in
            let data = dictionary["data"]
            let array = data as! Array<Dictionary<String, AnyObject>>
            var result:[ItemModel] = []
            for item in array {
                let id = item["id"] as? String
                let name = item["attributes"]?["name"] as? String
                let colorString = item["attributes"]?["color"] as? String
                // added
                let preview = item["attributes"]?["preview"] as? String
                var color:UIColor?
                switch colorString! {
                case "Red": color = UIColor.red
                case "Green": color = UIColor.green
                case "Blue": color = UIColor.blue
                case "Yellow": color = UIColor.yellow
                case "Purple": color = UIColor.purple
                default: color = UIColor.black
                }
                // added
                let itemModel = ItemModel(name: name!, color: color!, id: id!, preview: preview!)
                result.append(itemModel)
                
            }
            // added:
            let orderedItems = self.orderItemsById(parsedItems: result)
            self.delegate?.downloadedItems(orderedItems)
        }
    }
    
    func downloadItemWithID(_ id:String) {
        let filename = "Item\(id).json"
        request(filename: filename) { dictionary in
            let data = dictionary["data"]
            let id = data!["id"]! as? String
            let attributes = data!["attributes"]! as! Dictionary<String, AnyObject>
            let name = attributes["name"] as? String
            let colorString = attributes["color"] as? String
            
            var color:UIColor?
            switch colorString! {
            case "Red": color = UIColor.red
            case "Green": color = UIColor.green
            case "Blue": color = UIColor.blue
            case "Yellow": color = UIColor.yellow
            case "Purple": color = UIColor.purple
            default: color = UIColor.black
            }
            let desc = attributes["desc"] as? String
            // added:
            let itemModelDetails = ItemDetailsModel(name: name!, color: color!, id: id!, desc: desc!)
            self.delegate?.downloadedItemDetails(itemModelDetails)
        }
    }
    
    private func request(filename:String, completionBlock:@escaping (Dictionary<String, AnyObject>) -> Void) {
        DispatchQueue.global(qos: .background).async{
            if let dictionary = JSONParser.jsonFromFilename(filename) {
                DispatchQueue.main.async {
                    completionBlock(dictionary)
                }
            } else {
                completionBlock([:])
            }
        }
    }
    
    func orderItemsById(parsedItems: [ItemModel]) -> [ItemModel]{
        return parsedItems.sorted(by: { $0.id < $1.id })
    }
    
}
