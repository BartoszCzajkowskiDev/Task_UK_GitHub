//
//  JSONParser.swift
//  Route1
//
//  Created by Paweł Sporysz on 11.12.2015.
//  Copyright © 2015 Untitled Kingdom. All rights reserved.
//

import Foundation

class JSONParser {
    
    static func jsonFromFilename(_ filename:String) -> [String:AnyObject]? {
        guard let filepath = Bundle.main.path(forResource: filename, ofType: "") else { return nil }
        do {
            let stringContent = try String(contentsOfFile: filepath, encoding: String.Encoding.utf8)
            if let data = stringContent.data(using: String.Encoding.utf8) {
                let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                return dictionary as? [String:AnyObject]
            } else {
                return nil
            }
        } catch _ {}
        return nil
    }
    
}
