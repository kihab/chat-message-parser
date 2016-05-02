//
//  ThreadUtil.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/3/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import Foundation

//A Global thread util
class ThreadUtil {
    
    
    //Global function used to run code in background, forground and or with delay and completion in the foreground
    class func backgroundThread(delay: Double = 0.0, background: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
        
        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
            
            if(background != nil) {
                background!();
            }
            
            let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
            
            dispatch_after(popTime, dispatch_get_main_queue()) {
                if(completion != nil){ completion!(); }
            }
        }
    }
}