//
//  AdModule.swift
//  ReactNativeSDKDemo
//
//  Created by Suyash Saxena on 6/29/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit

@objc (AdModule)
class AdModule: RCTEventEmitter
{
    override func supportedEvents() -> [String]!
    { 
        return ["log"]
    }
    
    @objc func log(message: String)
    {
        self.sendEvent(withName: "log", body: message)
    }
}
