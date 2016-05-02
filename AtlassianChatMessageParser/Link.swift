//
//  Link.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation

//Link object containing link url and title
struct Link {
    
    var title : String!
    var url : String!
    
    //special initializer that takes the url string and extract the title from it.
    init (url:String) {
        
        self.url = url
        
        if let title = URLUtil.getTitleFromURL(url) {
            
            self.title = title
            
        } else {
            self.title = "Title is not Available"
        }
        
    }
    
    //Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
    func toDictionary() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        if title != nil{
            dictionary["title"] = title
        }
        
        if url != nil{
            dictionary["url"] = url
        }
        
        return dictionary
    }
    
    //return a json formated string version of the Link object.
    func toJsonString() -> String {
      
        return JsonUtil.convertDictionaryToJsonString(self.toDictionary())
    }
    
    
}