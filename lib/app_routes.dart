import 'package:final_exam/screen/cart/view/cart_screen.dart';
import 'package:final_exam/screen/home/view/home_screen.dart';
import 'package:final_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/widgets.dart';

Map<String,WidgetBuilder>app_routes={
  "/":(c1)=>const SplashScreen(),
  "/home":(c1)=>const HomeScreen(),
  "/cart":(c1)=>const CartScreen(),

};