import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed("/home"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage("assets/image/img.png"),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.cover,

        )
      ],
    );
  }
}
