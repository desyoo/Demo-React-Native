/**
 * Copyright (c) AppLovin.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

#if __has_include(<AppLovinSDK/AppLovinSDK.h>)
    #import <AppLovinSDK/AppLovinSDK.h>
#else
    #import "ALSdk.h"
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initializing our SDK at launch is very important as it'll start preloading ads in the background.
    [ALSdk initializeSdk];
    [ALSdk shared].settings.isTestAdsEnabled = YES;
    
    NSURL *jsCodeLocation;
    
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot: @"index" fallbackResource: nil];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                                        moduleName: @"ReactNativeSDKDemo"
                                                 initialProperties: nil
                                                     launchOptions: launchOptions];
    rootView.backgroundColor = UIColor.whiteColor;
    
    UIViewController *rootViewController = [[UIViewController alloc] init];
    rootViewController.view = rootView;
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
