import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/splash/SplashScreenUI.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) // Set portrait orientation
       .then((_) {
      runApp( const MaterialApp(title: "Material App Title", home: SplashScreenUI()));
   });
}
