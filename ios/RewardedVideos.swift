//
//  RewardedVideos.swift
//  AL_React
//
//  Created by Suyash Saxena on 6/25/18.
//  Copyright © 2018 AppLovin. All rights reserved.
//

import UIKit
import AppLovinSDK

@objc (RewardedVideos)
class RewardedVideos: AdModule, ALAdLoadDelegate, ALAdRewardDelegate, ALAdDisplayDelegate, ALAdVideoPlaybackDelegate
{
    @objc func initAd() -> Void {
        // Set an optional user identifier used for S2S callbacks
        ALIncentivizedInterstitialAd.setUserIdentifier("DEMO_USER_IDENTIFIER");
    }
    
    @objc func showAd() -> Void {
        // You need to preload each rewarded video before it can be displayed
        if ALIncentivizedInterstitialAd.isReadyForDisplay()
        {
            // Optional: Assign delegates
            ALIncentivizedInterstitialAd.shared().adDisplayDelegate = self
            ALIncentivizedInterstitialAd.shared().adVideoPlaybackDelegate = self
            
            ALIncentivizedInterstitialAd.showAndNotify(self)
        }
        else
        {
            preloadAd()
        }
    }
    
    @objc func preloadAd() -> Void
    {
        log(message: "Preloading...")
        ALIncentivizedInterstitialAd.shared().preloadAndNotify(self)
    }
    
    override func supportedEvents() -> [String]!
    {
        return ["log"]
    }
    
    // MARK: Ad Load Delegate
    
    func adService(_ adService: ALAdService, didLoad ad: ALAd)
    {
        log(message: "Rewarded Video Loaded")
    }
    
    func adService(_ adService: ALAdService, didFailToLoadAdWithError code: Int32)
    {
        // Look at ALErrorCodes.h for list of error codes
        log(message: "Rewarded video failed to load with error code \(code)")
    }
    
    // MARK: Ad Reward Delegate
    
    func rewardValidationRequest(for ad: ALAd, didSucceedWithResponse response: [AnyHashable: Any])
    {
        /* AppLovin servers validated the reward. Refresh user balance from your server.  We will also pass the number of coins
         awarded and the name of the currency.  However, ideally, you should verify this with your server before granting it. */
        
        // i.e. - "Coins", "Gold", whatever you set in the dashboard.
        let currencyName = response["currency"]
        
        // For example, "5" or "5.00" if you've specified an amount in the UI.
        let amountGivenString = response["amount"]
        if let amount = amountGivenString as? NSString
        {
            let amountGiven = amount.floatValue
            
            // Do something with this information.
            // MYCurrencyManagerClass.updateUserCurrency(currencyName withChange: amountGiven)
            log(message: "Rewarded \(amountGiven) \(String(describing: currencyName))")
        }
        
        // By default we'll show a UIAlertView informing your user of the currency & amount earned.
        // If you don't want this, you can turn it off in the Manage Apps UI.
    }
    
    func rewardValidationRequest(for ad: ALAd, didFailWithError responseCode: Int)
    {
        if responseCode == Int(kALErrorCodeIncentivizedUserClosedVideo)
        {
            // Your user exited the video prematurely. It's up to you if you'd still like to grant
            // a reward in this case. Most developers choose not to. Note that this case can occur
            // after a reward was initially granted (since reward validation happens as soon as a
            // video is launched).
        }
        else if responseCode == Int(kALErrorCodeIncentivizedValidationNetworkTimeout) || responseCode == Int(kALErrorCodeIncentivizedUnknownServerError)
        {
            // Some server issue happened here. Don't grant a reward. By default we'll show the user
            // a UIAlertView telling them to try again later, but you can change this in the
            // Manage Apps UI.
        }
        else if responseCode == Int(kALErrorCodeIncentiviziedAdNotPreloaded)
        {
            // Indicates that you called for a rewarded video before one was available.
        }
        
        log(message: "Reward validation request failed with error code \(responseCode)")
    }
    
    func rewardValidationRequest(for ad: ALAd, didExceedQuotaWithResponse response: [AnyHashable: Any])
    {
        // Your user has already earned the max amount you allowed for the day at this point, so
        // don't give them any more money. By default we'll show them a UIAlertView explaining this,
        // though you can change that from the Manage Apps UI.
        log(message: "Reward validation request did exceed quota with response: \(response)")
    }
    
    func rewardValidationRequest(for ad: ALAd, wasRejectedWithResponse response: [AnyHashable: Any])
    {
        // Your user couldn't be granted a reward for this view. This could happen if you've blacklisted
        // them, for example. Don't grant them any currency. By default we'll show them a UIAlertView explaining this,
        // though you can change that from the Manage Apps UI.
        log(message: "Reward validation request was rejected with response: \(response)")
    }
    
    func userDeclined(toViewAd ad: ALAd)
    {
        log(message: "User declined to view ad")
    }
    
    // MARK: Ad Display Delegate
    
    func ad(_ ad: ALAd, wasDisplayedIn view: UIView)
    {
        log(message: "Ad Displayed")
    }
    
    func ad(_ ad: ALAd, wasHiddenIn view: UIView)
    {
        log(message: "Ad Dismissed")
    }
    
    func ad(_ ad: ALAd, wasClickedIn view: UIView)
    {
        log(message: "Ad Clicked")
    }
    
    // MARK: Ad Video Playback Delegate
    
    func videoPlaybackBegan(in ad: ALAd)
    {
        log(message: "Video Started")
    }
    
    func videoPlaybackEnded(in ad: ALAd, atPlaybackPercent percentPlayed: NSNumber, fullyWatched wasFullyWatched: Bool)
    {
        log(message: "Video Ended")
    }
}
