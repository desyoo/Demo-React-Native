package com.applovin.apps.demo.reactnative;

import android.app.Application;
import android.util.Log;

import com.applovin.sdk.AppLovinSdk;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
import com.facebook.soloader.SoLoader;

import java.util.Arrays;
import java.util.List;

public class MainApplication
        extends Application
        implements ReactApplication
{
    private static final String TAG = "MainApplication";

    private static final String KEY_SHARED_PREFERENCES_NAMESPACE = "com.applovin.apps.demo.shared_preferences";
    private static final String KEY_PROMPTED_CONFIG_FLAGS        = "com.applovin.apps.demo.shared_preferences.prompted_config_flags";

    private final ReactNativeHost mReactNativeHost = new ReactNativeHost( this )
    {
        @Override
        public boolean getUseDeveloperSupport()
        {
            return BuildConfig.DEBUG;
        }

        @Override
        protected List<ReactPackage> getPackages()
        {
            return Arrays.<ReactPackage>asList(
                    new MainReactPackage(),
                    new AppLovin()
            );
        }

        @Override
        protected String getJSMainModuleName()
        {
            return "index";
        }
    };

    @Override
    public void onCreate()
    {
        super.onCreate();
        SoLoader.init( this, /* native exopackage */ false );

        //
        // Initializing our SDK at launch is very important as it'll start preloading ads in the background.
        //
        AppLovinSdk.initializeSdk( getApplicationContext() );
        AppLovinSdk.getInstance( getApplicationContext() ).getSettings().setTestAdsEnabled( true );

        checkSdkKey();
    }

    private void checkSdkKey()
    {
        final String sdkKey = AppLovinSdk.getInstance( getApplicationContext() ).getSdkKey();
        if ( "YOUR_SDK_KEY".equalsIgnoreCase( sdkKey ) )
        {
            Log.e( TAG, "Please update your sdk key in the manifest file." );
        }
    }

    @Override
    public ReactNativeHost getReactNativeHost()
    {
        return mReactNativeHost;
    }
}
