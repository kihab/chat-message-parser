//
//  ChatMessage.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation

//This is a ChatMessage Object /Struct
struct ChatMassage{
    
    var emoticons : [String]!
    var links : [Link]!
    var mentions : [String]!
    
    
    //Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
    func toDictionary() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        if emoticons != nil{
            dictionary["emoticons"] = emoticons
        }
        
        if links != nil{
            
            var dictionaryElements = [NSDictionary]()
            for linksElement in links {
                dictionaryElements.append(linksElement.toDictionary())
            }
            dictionary["links"] = dictionaryElements
        }
        
        if mentions != nil{
            dictionary["mentions"] = mentions
        }
        
        return dictionary
    }
    
    
    //return a json formated string version of the chat Message object.
    func toJsonString() -> String {
        
        return JsonUtil.convertDictionaryToJsonString(self.toDictionary())
    }
    
    
    
    
}