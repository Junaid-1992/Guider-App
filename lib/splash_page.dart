


import 'package:darasni/strings_and_const.dart';
import 'package:darasni/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final TextStyle welcomeStyle = TextStyle(fontSize: 25, color: AppTheme.primaryColor);

  @override
  void initState() {

    checkUserStatusAndNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageRes.assetBackground), // Update with your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(ImageRes.assetsAppLogo),
            ),


            const SizedBox(height: 116),
            Text(
              "Welcome to Google Map",
              style: welcomeStyle,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The", style: TextStyle(fontSize: 22, color: AppTheme.secondaryColor)),
                Text(" world’s #1",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.secondaryColor)),
              ],
            ),
            Text(" Location Guider",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.secondaryColor)),
            Text(" platform.",
                style: TextStyle(fontSize: 22, color: AppTheme.secondaryColor)),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }

  void checkUserStatusAndNavigate() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
            return Get.offAll(() => LandingPage());
      },
    );
  }
}

