#!/bin/bash

# Usage: ./build.sh [ios|android]

PLATFORM=$1

if [ -z "$PLATFORM" ]; then
  echo "Usage: ./build.sh [ios|android]"
  echo "Example: ./build.sh ios"
  exit 1
fi

if [ "$PLATFORM" == "ios" ]; then
  echo "🏗️  Building iOS IPA..."
  cd ios
  # Using bundle exec to ensure we use the Gemfile versions
  /opt/homebrew/opt/ruby/bin/bundle exec fastlane build
  cd ..
  echo "✅ iOS Build finished. Output: ios/FastlaneApp.ipa"
elif [ "$PLATFORM" == "android" ]; then
  echo "🏗️  Building Android APK..."
  cd android
  /opt/homebrew/opt/ruby/bin/bundle exec fastlane build
  cd ..
  echo "✅ Android Build finished. Output: android/app/build/outputs/apk/release/app-release.apk"
else
  echo "❌ Invalid platform. Use 'ios' or 'android'."
  exit 1
fi
