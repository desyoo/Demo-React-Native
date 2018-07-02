# AppLovin React Native Demo
This is our open source demo application for React Native. You may re-use any code in your own project(s). If you have any questions, feel free to drop us a line at support@applovin.com.
## React Native Setup
Install required node modules with `$ npm install`.

## iOS Setup
1. Go to `ios/` and open the `.xcodeproj` project in Xcode.
1. Download the latest SDK from https://applovin.com.

2. Drag-and-drop `AppLovinSDK.framework` into the root folder of the project. Check off "Copy items if needed".

3. Link the Following Frameworks in Your Project

   - AdSupport
   - AVFoundation
   - CoreGraphics
   - CoreMedia
   - CoreTelephony
   - StoreKit
   - SystemConfiguration
   - UIKit
   - WebKit
   - libz.tbd

3. Add your AppLovin SDK key into the `Info.plist` under `AppLovinSdkKey` row.

## Android Setup

1. Open the project from the `android/` directory. Add your SDK key into your `AndroidManifest.xml` file, inside the `<application>` tag:
```
<meta-data android:name="applovin.sdk.key" android:value="YOUR_SDK_KEY_HERE" />
```
2. Do a Gradle sync and run the app! The project will automatically import the latest version of our SDK via [JCenter](https://bintray.com/applovin/Android/sdk_android).

## Starting from Scratch?
1. This demo app is built over [`create-react-native-app`](https://github.com/react-community/create-react-native-app).
```
$ npm install -g create-react-native-app
$ create-react-native-app my-app
$ cd my-app/
$ yarn eject
```
2. Select `❯ React Native: I'd like a regular React Native project. `

Your `ios/` and `android/` directories are now setup to integrate native modules from the AppLovinSDK.
