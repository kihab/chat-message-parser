//
//  StringExtensions.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation

//This is a string extension to ease the search for patterns inside string using regext matching
extension String {
    
    //Extract mentions from a string using regex
    var mentions:[String]! {
        
        //Removing @ character from result - TODO::Use orignal regex to remove @
        var mentionsArr = RegexUtil.matchesForRegexInText(RegexUtil.mentionRegex, text: self)
        
        for (index, mention) in mentionsArr.enumerate() {
            mentionsArr[index] = String(mention.characters.dropFirst())
        }
        
        return mentionsArr
    }
    
    //Extract links from a string using regex
    var links:[Link]! {
        
        var links = [Link]()
        
        let stringLinks = RegexUtil.matchesForRegexInText(RegexUtil.linkRegex, text: self)
        
        if stringLinks.count > 0 {
            
            for  link in stringLinks {
                let linkObj:Link = Link(url: link)
                links.append(linkObj)
            }
            
            return links
            
        } else {
            
            return []
        }
        
        
        
    }
    
    //Extract emoticons from a string using regex
    var emoticons:[String]! {
        
        //Removing ( ) character from result - TODO::Use orignal regex to remove ( )
        var emoticonsArr =  RegexUtil.matchesForRegexInText(RegexUtil.emoticonRegex, text: self)
        
        for (index, emoticon) in emoticonsArr.enumerate() {
            emoticonsArr[index] = String(emoticon.characters.dropFirst())
            emoticonsArr[index] = String(emoticonsArr[index].characters.dropLast())
        }

        return emoticonsArr
    }
}