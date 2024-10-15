import 'package:final_exam/screen/home/view/home_screen.dart';
import 'package:final_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/widgets.dart';

Map<String,WidgetBuilder>app_routes={
  "/":(c1)=>SplashScreen(),
  "/home":(c1)=>HomeScreen(),

};