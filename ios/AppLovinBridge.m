//
//  AppLovinBridge.m
//  AL_React
//
//  Created by Suyash Saxena on 6/25/18.
//  Copyright © 2018 AppLovin. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>

@interface RCT_EXTERN_MODULE(Interstitials, NSObject)

RCT_EXTERN_METHOD(initAd)
RCT_EXTERN_METHOD(showAd)

RCT_EXTERN_METHOD(log: String)

@end

@interface RCT_EXTERN_MODULE(RewardedVideos, NSObject)

RCT_EXTERN_METHOD(initAd)
RCT_EXTERN_METHOD(preloadAd)
RCT_EXTERN_METHOD(showAd)
RCT_EXTERN_METHOD(log: String)

@end

@interface RCT_EXTERN_MODULE(Banners, NSObject)

RCT_EXTERN_METHOD(initAd)
RCT_EXTERN_METHOD(loadNextAd)
RCT_EXTERN_METHOD(closeAd)
RCT_EXTERN_METHOD(log: String)

@end
