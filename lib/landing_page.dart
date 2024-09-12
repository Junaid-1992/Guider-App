import 'package:darasni/proposepage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '/strings_and_const.dart';
import '/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'chooselocaion.dart';
import 'homepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> pagesList = <Widget>[
    const HomePage(),
    const ChooselocaionPage(),
    const SizedBox(),
    const HomePage(),
    const ProposePage(),

  ];

  int screenIndex = 0;
  final FlutterShareMe flutterShareMe = FlutterShareMe();
  final String appLink = "https://www.figma.com/design/umInllirnR9nM3EWXmoIb7/Buddyp2p-(Copy)?node-id=5-12813&node-type=frame&t=jTC58k56xR7v9wy2-0";

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  void _reloadData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList.elementAt(screenIndex),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: Stack(
        alignment: Alignment.center,

        children: [
          // Increase the height of the BottomNavigationBar by wrapping it in a Container
          Container(
            height: 90,



            // Adjust the height here
            child: BottomNavigationBar(
              backgroundColor: Colors.white, // Set the background color to white
              type: BottomNavigationBarType.fixed, // Ensure it is fixed
              elevation: 0,

              items: [
                BottomNavigationBarItem(

                  icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      ImageRes.assetsSchedule,
                      color: screenIndex == 0
                          ? AppTheme.primaryColor
                          : AppTheme.greyColor,
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      ImageRes.assetsBook,
                      color: screenIndex == 1
                          ? AppTheme.primaryColor
                          : AppTheme.greyColor,
                    ),
                  ),
                  label: "",
                ),
                // Placeholder for the logo (This is a hack to make space for the logo)
                const BottomNavigationBarItem(
                  icon: SizedBox(width: 0), // Empty space
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      ImageRes.assetsChat,
                      color: screenIndex == 2
                          ? AppTheme.primaryColor
                          : AppTheme.greyColor,
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      ImageRes.assetsAccount,
                      color: screenIndex == 3
                          ? AppTheme.primaryColor
                          : AppTheme.greyColor,
                    ),
                  ),
                  label: "",
                ),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppTheme.primaryColor,
              currentIndex: screenIndex,
              onTap: (int index) {
                setState(() {
                  print('index $index');
                  screenIndex = index;
                });
              },
            ),
          ),
          // Centered logo
          Positioned(

            bottom: 5, // Adjust the vertical positioning based on increased height
            child: GestureDetector(
              onTap: () {

                Get.to(HomePage());
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  ImageRes.assetsBottomNav, // Your logo asset
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
