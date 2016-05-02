//
//  RegexUtil.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation


//A Util to help in all Regex related tasks
class RegexUtil {
    
    //emoticons regex pattern
    static let emoticonRegex = "\\((.*?)\\)"
    
    //mentions regex pattern
    static let mentionRegex = "@((?:[\\w]+[\\w]))"
    
    //links regex pattern
    static let linkRegex = "(?i)\\b((?:[a-z][\\w-]+:(?:/{1,3}|[a-z0-9%])|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?«»“”‘’]))"
    
    
    //a function that search a  string by applying a certains regex pattern
    class func matchesForRegexInText(regex: String!, text: String!) -> [String] {
        
        do {
            
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            
            let results = regex.matchesInString(text,
                                                options: [], range: NSMakeRange(0, nsString.length))
            
            return results.map { nsString.substringWithRange($0.range)}
            
        } catch let error as NSError {
            
            print("invalid regex: \(error.localizedDescription)")
            
            return []
        }
    }
}