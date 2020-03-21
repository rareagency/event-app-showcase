
# Event app showcase

Main features:
* Instagram-ish feed
* Schedule for your event, when afterparty?
* Profile
* Registering to app per invitation basis

Inspiration:
* https://play.google.com/store/apps/details?id=com.wappuapp
* https://apps.apple.com/lu/app/luuppi50/id1451954350

## Android Studio workspace setup tips

### Setup environment variables

* Set `ANDROID_HOME` to point to your Android SDK location.
* If you can't select _Target device_ on Android Studio once project is open, add this to your PATH variable: `AndroidSDK/platform-tools/`

### Troubleshoot

* Run button is grey, can't run the project
	* Set path to Dart SDK on Android Studio `(Properties → Languages & Frameworks → Dart)`
  
* Error: `Cannot find symbol 'Properties' / 'GradleException'"`
	* [Solution](https://github.com/flutter/flutter/issues/29608#issuecomment-548649907)
  
* When trying to run: `"APT: error: resource android:attr/fontVariationSettings"`
	* Change `compileSdkVersion` in `android/app/build.gradle` to match to your SDK version.
