#!/bin/bash

flutter pub get
flutter build web --no-sound-null-safety -t lib/web_main.dart