//
//  URLUtil.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation
import Kanna

//URL related Util responsible for all the URL related operations
//separating this Util allows us to change how to extract title for example at any time without affecting our code
class URLUtil {
    
    //gets the title out of a URL using Kanna Lib.
    class func getTitleFromURL(urlString:String) -> String! {
        
        if let doc = Kanna.HTML(url: (NSURL(string: urlString)!), encoding: NSUTF8StringEncoding) {
            
            if let title = doc.title {
                
                return title
            }
            
        }
        
        return nil
    }
}