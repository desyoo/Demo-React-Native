package com.applovin.apps.demo.reactnative.ad_modules;

import com.applovin.adview.AppLovinInterstitialAd;
import com.applovin.adview.AppLovinInterstitialAdDialog;
import com.applovin.sdk.AppLovinAd;
import com.applovin.sdk.AppLovinAdClickListener;
import com.applovin.sdk.AppLovinAdDisplayListener;
import com.applovin.sdk.AppLovinAdLoadListener;
import com.applovin.sdk.AppLovinAdVideoPlaybackListener;
import com.applovin.sdk.AppLovinSdk;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactMethod;

public class Interstitials
        extends AdModule
        implements AppLovinAdLoadListener, AppLovinAdDisplayListener, AppLovinAdClickListener, AppLovinAdVideoPlaybackListener
{
    private AppLovinInterstitialAdDialog mInterstitialAd;

    public Interstitials(ReactApplicationContext reactContext)
    {
        super( reactContext );
    }

    @ReactMethod
    public void initAd()
    {
        mInterstitialAd = AppLovinInterstitialAd.create( AppLovinSdk.getInstance( getReactApplicationContext() ), getReactApplicationContext() );

        //
        // Optional: Set ad load, ad display, ad click, and ad video playback callback listeners
        //
        mInterstitialAd.setAdLoadListener( this );
        mInterstitialAd.setAdDisplayListener( this );
        mInterstitialAd.setAdClickListener( this );
        mInterstitialAd.setAdVideoPlaybackListener( this ); // This will only ever be used if you have video ads enabled.
    }

    @ReactMethod
    public void showAd()
    {
        mInterstitialAd.show();
    }

    @Override
    public void adReceived(AppLovinAd appLovinAd)
    {
        log( "Interstitial loaded" );
    }

    @Override
    public void failedToReceiveAd(int errorCode)
    {
        // Look at AppLovinErrorCodes.java for list of error codes
        log( "Interstitial failed to load with error code " + errorCode );
    }

    //
    // Ad Display Listener
    //
    @Override
    public void adDisplayed(AppLovinAd appLovinAd)
    {
        log( "Interstitial Displayed" );
    }

    @Override
    public void adHidden(AppLovinAd appLovinAd)
    {
        log( "Interstitial Hidden" );
    }

    //
    // Ad Click Listener
    //
    @Override
    public void adClicked(AppLovinAd appLovinAd)
    {
        log( "Interstitial Clicked" );
    }

    //
    // Ad Video Playback Listener
    //
    @Override
    public void videoPlaybackBegan(AppLovinAd appLovinAd)
    {
        log( "Video Started" );
    }

    @Override
    public void videoPlaybackEnded(AppLovinAd appLovinAd, double percentViewed, boolean wasFullyViewed)
    {
        log( "Video Ended" );
    }
}
