//
//  ViewController.swift
//  AtlassianChatMessageParser
//
//  Created by Karim Ihab on 5/2/16.
//  Copyright © 2016 Karim Ihab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Test Cases:
        
//        let chatMessage1 = "Hi @John take a look"
//        let chatMessage2 = "(android)  with (coffee)"
//        let chatMessage3 = "check twitter link;http://www.twitter.com"
        
        
        let chatMessage4 = "@bob @john (success) such a cool feature; https://twitter.com/jdorfman/status/430511497475670016"

        //Start the parsing in a background thread not to block main
        NSLog("Parsing Chat Message...")
        
        ThreadUtil.backgroundThread(0, background: {
            
                print(ChatMessageService.extractDetailsInJsonFormat(chatMessage4))
            
            }) {
                
                NSLog("Done!")
        }
        
    }

}

