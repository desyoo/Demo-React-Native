package com.applovin.apps.demo.reactnative.ad_modules;

import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import com.applovin.adview.AppLovinAdView;
import com.applovin.adview.AppLovinAdViewDisplayErrorCode;
import com.applovin.adview.AppLovinAdViewEventListener;
import com.applovin.sdk.AppLovinAd;
import com.applovin.sdk.AppLovinAdClickListener;
import com.applovin.sdk.AppLovinAdDisplayListener;
import com.applovin.sdk.AppLovinAdLoadListener;
import com.applovin.sdk.AppLovinAdSize;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.UiThreadUtil;

public class Banners
        extends AdModule
{
    private AppLovinAdView mAdView;

    public Banners(ReactApplicationContext reactContext)
    {
        super( reactContext );
    }

    @ReactMethod
    public void initAd()
    {
        UiThreadUtil.runOnUiThread( new Runnable()
        {
            @Override
            public void run()
            {
                mAdView = new AppLovinAdView( AppLovinAdSize.BANNER, getReactApplicationContext() );

                mAdView.setAdLoadListener( new AppLovinAdLoadListener()
                {
                    @Override
                    public void adReceived(final AppLovinAd ad)
                    {
                        log( "Banner loaded" );
                    }

                    @Override
                    public void failedToReceiveAd(final int errorCode)
                    {
                        // Look at AppLovinErrorCodes.java for list of error codes
                        log( "Banner failed to load with error code " + errorCode );
                    }
                } );

                mAdView.setAdDisplayListener( new AppLovinAdDisplayListener()
                {
                    @Override
                    public void adDisplayed(final AppLovinAd ad)
                    {
                        log( "Banner Displayed" );
                    }

                    @Override
                    public void adHidden(final AppLovinAd ad)
                    {
                        log( "Banner Hidden" );
                    }
                } );

                mAdView.setAdClickListener( new AppLovinAdClickListener()
                {
                    @Override
                    public void adClicked(final AppLovinAd ad)
                    {
                        log( "Banner Clicked" );
                    }
                } );

                mAdView.setAdViewEventListener( new AppLovinAdViewEventListener()
                {
                    @Override
                    public void adOpenedFullscreen(final AppLovinAd ad, final AppLovinAdView adView)
                    {
                        log( "Banner opened fullscreen" );
                    }

                    @Override
                    public void adClosedFullscreen(final AppLovinAd ad, final AppLovinAdView adView)
                    {
                        log( "Banner closed fullscreen" );
                    }

                    @Override
                    public void adLeftApplication(final AppLovinAd ad, final AppLovinAdView adView)
                    {
                        log( "Banner left application" );
                    }

                    @Override
                    public void adFailedToDisplay(final AppLovinAd ad, final AppLovinAdView adView, final AppLovinAdViewDisplayErrorCode code)
                    {
                        log( "Banner failed to display with error code " + code );
                    }
                } );

                View content = getCurrentActivity().findViewById( android.R.id.content );
                if ( content instanceof ViewGroup )
                {
                    final FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams( ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM );
                    ( (ViewGroup) content ).addView( mAdView, layout );
                }

                mAdView.loadNextAd();
            }
        } );
    }

    @ReactMethod
    public void loadNextAd()
    {
        mAdView.loadNextAd();
    }

    @ReactMethod
    public void closeAd()
    {
        UiThreadUtil.runOnUiThread( new Runnable()
        {
            @Override
            public void run()
            {
                mAdView.removeAllViews();
            }
        } );
    }
}
