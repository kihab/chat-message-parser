//
//  JsonUtil.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation


//A separate Json Util to convert object and all Json operation
//Seprating this Util allows us to change the way to convert from and to JSON any time without affecting out Code
class JsonUtil {
    
    //a fucntion that takes a dictionary object and convert into a json formated string
    class func convertDictionaryToJsonString(dict:NSDictionary) -> String! {
        
        do {
            
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
            
            let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding)
            
            return jsonString
            
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
    
    


}