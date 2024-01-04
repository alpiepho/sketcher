#!/bin/bash
# Assumes use of https://www.appicon.co/ 
#         and results downloaed to ~/Downloads/AppIcon.zip 
#         and extracted to ~/Downloads/AppIcon
cp  ~/Downloads/AppIcons/android/mipmap-xxxhdpi/ic_launcher.png   ./web/icons/Icon-192.png
cp ~/Downloads/Appicons/playstore.png                             ./web/icons/Icon-512.png
cp  ~/Downloads/AppIcons/android/mipmap-xxxhdpi/ic_launcher.png   ./web/icons/Icon-maskable-192.png
cp ~/Downloads/Appicons/playstore.png                             ./web/icons/Icon-maskable-512.png
cp ~/Downloads/AppIcons/Assets.xcassets/AppIcon.appiconset/72.png ./web/favicon.ico


