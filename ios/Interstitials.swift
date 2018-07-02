//
//  Interstitials.swift
//  AL_React
//
//  Created by Suyash Saxena on 6/25/18.
//  Copyright © 2018 AppLovin. All rights reserved.
//

import UIKit
import AppLovinSDK

@objc (Interstitials)
class Interstitials: AdModule, ALAdLoadDelegate, ALAdDisplayDelegate, ALAdVideoPlaybackDelegate
{
    @objc func initAd() -> Void
    {
        ALInterstitialAd.shared().adLoadDelegate = self
        ALInterstitialAd.shared().adDisplayDelegate = self
        ALInterstitialAd.shared().adVideoPlaybackDelegate = self
    }
    
    @objc func showAd() -> Void
    {
        ALInterstitialAd.shared().show()
    }
    
    override func supportedEvents() -> [String]!
    {
        return ["log"]
    }
    
    // MARK: Ad Load Delegate
    
    func adService(_ adService: ALAdService, didLoad ad: ALAd)
    {
        log(message: "Interstitial Loaded")
    }
    
    func adService(_ adService: ALAdService, didFailToLoadAdWithError code: Int32)
    {
        // Look at ALErrorCodes.h for list of error codes
        log(message: "Interstitial failed to load with error code \(code)")
    }
    
    // MARK: Ad Display Delegate
    
    func ad(_ ad: ALAd, wasDisplayedIn view: UIView)
    {
        log(message: "Interstitial Displayed")
    }
    
    func ad(_ ad: ALAd, wasHiddenIn view: UIView)
    {
        log(message: "Interstitial Dismissed")
    }
    
    func ad(_ ad: ALAd, wasClickedIn view: UIView)
    {
        log(message: "Interstitial Clicked")
    }
    
    // MARK: Video Playback Delegate
    
    func videoPlaybackBegan(in ad: ALAd)
    {
        log(message: "Video Started")
    }
    
    func videoPlaybackEnded(in ad: ALAd, atPlaybackPercent percentPlayed: NSNumber, fullyWatched wasFullyWatched: Bool)
    {
        log(message: "Video Ended")
    }
}
