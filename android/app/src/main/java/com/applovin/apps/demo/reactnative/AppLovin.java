package com.applovin.apps.demo.reactnative;

import com.applovin.apps.demo.reactnative.ad_modules.Banners;
import com.applovin.apps.demo.reactnative.ad_modules.Interstitials;
import com.applovin.apps.demo.reactnative.ad_modules.RewardedVideos;
import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class AppLovin
        implements ReactPackage
{
    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext)
    {
        return Collections.emptyList();
    }

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext)
    {
        return Arrays.<NativeModule>asList(
                new Interstitials( reactContext ),
                new RewardedVideos( reactContext ),
                new Banners( reactContext )
        );
    }
}
