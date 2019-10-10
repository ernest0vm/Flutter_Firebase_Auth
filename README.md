# Flutter Firebase Auth

A new Flutter application using authentication from Firebase.

## Android Setup

ApplicationID
```
com.ernestovaldez.flutter_firebase_auth
```

in `/gradle.build`
```
buildscript {
ext.kotlin_version = '1.3.10'
    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.1'
        classpath 'com.google.gms:google-services:4.3.2'
    }
}
```

in `/gradle/wrapper/gradle-wrapper.properties`
```
distributionUrl=https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
```

add **google-services.json** in `/android/app/`

## iOS Setup

BundleID
```
com.ernestovaldez.flutterFirebaseAuth
```

configure `URL schema` in `info.plist` to use **Google auth service**
```
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>Google Auth</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>com.googleusercontent.apps.your-id-project</string>
			</array>
		</dict>
	</array>
```

add **GoogleService-info.plist** in `/ios/Runner/Runner/`


