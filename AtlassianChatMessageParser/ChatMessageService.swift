//
//  ChatMessageService.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation

//This is a separted Chat Message service responsible of everything about the chat message
class ChatMessageService {
    
    //this method construct a chatMessage object out of the string input and returns the required details in Json format 
    //required details are :
        // urls
        // emoticons
        // mentions
    class func extractDetailsInJsonFormat(message:String) -> String {
      
        //Constructing chatMessage Object
        let chatMessage:ChatMassage = ChatMassage(emoticons: message.emoticons, links: message.links, mentions: message.mentions)
        
        //The object has a builtin functio that convert it into JSON string
        return chatMessage.toJsonString()
        
        
    }
}