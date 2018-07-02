//
//  Banners.swift
//  AL_React
//
//  Created by Suyash Saxena on 6/25/18.
//  Copyright © 2018 AppLovin. All rights reserved.
//

import UIKit
import AppLovinSDK

@objc (Banners)
class Banners: AdModule, ALAdLoadDelegate, ALAdDisplayDelegate, ALAdViewEventDelegate
{
    let kBannerHeight: CGFloat = 50
    let rootViewController = UIApplication.shared.delegate?.window??.rootViewController
    let adView = ALAdView(size: .sizeBanner())
    
    @objc func initAd()
    {
        // Optional: Implement the ad delegates to receive ad events.
        adView.adLoadDelegate = self
        adView.adDisplayDelegate = self
        adView.adEventDelegate = self
        
        DispatchQueue.main.async{
            
            self.adView.loadNextAd()
            
            self.adView.translatesAutoresizingMaskIntoConstraints = false
            self.rootViewController?.view.addSubview(self.adView)
            self.rootViewController?.view.addConstraints([
                NSLayoutConstraint(item: self.adView, attribute: .leading, relatedBy: .equal, toItem: self.rootViewController?.view, attribute: .leading, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.adView, attribute: .trailing, relatedBy: .equal, toItem: self.rootViewController?.view, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.adView, attribute: .bottom, relatedBy: .equal, toItem: self.rootViewController?.view, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.adView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.kBannerHeight)
                ])
        }
    }
    
    @objc func loadNextAd()
    {
        adView.loadNextAd()
    }
    
    @objc func closeAd()
    {
        DispatchQueue.main.async {
            self.adView.removeFromSuperview()
        }
    }
    
    override func supportedEvents() -> [String]!
    {
        return ["log"]
    }
    
    // MARK: Ad Load Delegate
    
    func adService(_ adService: ALAdService, didLoad ad: ALAd)
    {
        log(message: "Banner Loaded")
    }
    
    func adService(_ adService: ALAdService, didFailToLoadAdWithError code: Int32)
    {
        // Look at ALErrorCodes.h for list of error codes
        log(message: "Banner failed to load with error code \(code)")
    }
    
    // MARK: Ad Display Delegate
    
    func ad(_ ad: ALAd, wasDisplayedIn view: UIView)
    {
        log(message: "Banner Displayed")
    }
    
    func ad(_ ad: ALAd, wasHiddenIn view: UIView)
    {
        log(message: "Banner Dismissed")
    }
    
    func ad(_ ad: ALAd, wasClickedIn view: UIView)
    {
        log(message: "Banner Clicked")
    }
    
    // MARK: Ad View Event Delegate
    
    func ad(_ ad: ALAd, didPresentFullscreenFor adView: ALAdView)
    {
        log(message: "Banner did present fullscreen")
    }
    
    func ad(_ ad: ALAd, willDismissFullscreenFor adView: ALAdView)
    {
        log(message: "Banner will dismiss fullscreen")
    }
    
    func ad(_ ad: ALAd, didDismissFullscreenFor adView: ALAdView)
    {
        log(message: "Banner did dismiss fullscreen")
    }
    
    func ad(_ ad: ALAd, willLeaveApplicationFor adView: ALAdView)
    {
        log(message: "Banner will leave application")
    }
    
    func ad(_ ad: ALAd, didReturnToApplicationFor adView: ALAdView)
    {
        log(message: "Banner did return to application")
    }
    
    func ad(_ ad: ALAd, didFailToDisplayIn adView: ALAdView, withError code: ALAdViewDisplayErrorCode)
    {
        log(message: "Banner did fail to display with error code: \(code)")
    }
}
