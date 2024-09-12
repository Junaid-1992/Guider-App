import '/Controllers/Booking%20Controller/booking_controller.dart';
import '/strings_and_const.dart';
import '/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chooselocaion.dart';

class ProposePage extends StatefulWidget {
  const ProposePage({super.key});

  @override
  State<ProposePage> createState() => _ProposePageState();
}

class _ProposePageState extends State<ProposePage> {
  String? filterValue;

  @override
  void initState() {
    super.initState();
    // _showBottomModal(context);
    Future.delayed(Duration.zero, () {
      _showBottomModal(context);
    });
  }

  void showProgress() {
    Get.generalDialog(
      pageBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Container(
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: AppTheme.primaryColor,
            ),
          ),
        );
      },
    );
  }

  bool searching = false;

  TextEditingController searchingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (BookingController controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [

                InteractiveViewer(

                  minScale: 1.0,
                  maxScale: 1.0,
                  child: Image.asset(
                    'assets/streetmap.jpg', // Replace with your map image
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width ,
                    height: MediaQuery.of(context).size.height ,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),  // Rounded top left corner
                          //   topRight: Radius.circular(10), // Rounded top right corner
                          // ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  // child: SearchForPeople(),
                                  child: SearchForPeople(
                                    textEditingController: searchingController,
                                    onChange: (String value) {
                                      // _showBottomModal(context);


                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      showPopupMenu(context);
                                    },
                                    child: Image.asset(
                                      ImageRes.assetsFilterIcon,
                                      height: 20,
                                      width: 20,
                                    ).paddingOnly(right: 10),
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              color: Color(0XffD8D8D8), // Color of the divider
                              thickness: 1, // Thickness of the divider
                              height: 0, // Space around the divider
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      showPopupMenu(context);
                                    },
                                    child: Image.asset(
                                      ImageRes.assetsKmart,
                                      width: 80,
                                    ).paddingOnly(left: 10, right: 10),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      showPopupMenu(context);
                                    },
                                    child: Image.asset(
                                      ImageRes.assetsEvvin,
                                      width: 80,
                                    ).paddingOnly(right: 10),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      showPopupMenu(context);
                                    },
                                    child: Image.asset(
                                      ImageRes.assetsVchar,
                                      width: 80,
                                    ).paddingOnly(right: 10),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      _showBottomModal(context);
                                    },
                                    child: Image.asset(
                                      ImageRes.assetsPlus,
                                      width: 25,
                                    ).paddingOnly(right: 10),
                                  ),
                                ),




                              ],
                            ),

                            const SizedBox(height: 10),


                          
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final double buttonWidth = button.size.width;
    final double buttonHeight = button.size.height;

    const double paddingFromTop = 120.0;

    final Offset topLeft = button.localToGlobal(Offset(0, buttonHeight + paddingFromTop), ancestor: overlay);
    final Offset bottomRight = button.localToGlobal(button.size.topRight(Offset.zero), ancestor: overlay);

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        topLeft,
        Offset(bottomRight.dx + buttonWidth, bottomRight.dy + paddingFromTop),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items: [
        PopupMenuItem<String>(
          value: 'filter',
          child: Row(
            children: [
              Icon(Icons.filter_list),
              SizedBox(width: 8),
              Text('Filter'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'favourite',
          child: Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 8),
              Text('Favourites'),
            ],
          ),
        ),
      ],
      color: Colors.white,
    ).then((value) {});
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to be scrollable
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7, // Initially, the modal takes 30% of the screen height
          minChildSize: 0.3,     // Minimum height when collapsed
          maxChildSize: 0.8,     // Maximum height when fully expanded (90% of screen)
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                ),

                child: Padding(

                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Modal Title Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NEAREST',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),

                        ],
                      ),
                      const SizedBox(height: 20),

                      // Show 3 Charger Cards initially
                      ChargerCard(),
                      ParkCard(),
                      ChargerCard(),
                      ChargerCard(),
                      ParkCard(),
                      ChargerCard(),

                      ParkCard(),
                      ParkCard(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }




}

class SearchForPeople extends StatelessWidget {
  final ValueChanged<String>? onChange;
  final TextEditingController? textEditingController;

  SearchForPeople({
    this.onChange,
    this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 50,
        margin: EdgeInsets.only(right: 10),
        child: TextFormField(
          controller: textEditingController,
          onChanged: onChange,
          decoration: InputDecoration(
            labelText: "Find on map",
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                ImageRes.assetsPin,
                width: 15,
                height: 15,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  );
}



class ChargerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to a new page when tapped using GetX
        Get.to(ChooselocaionPage()); // Navigate to NewPage using GetX
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon and text part
            Row(
              children: [
                // Icon
                Container(
                  child: Image.asset(
                    ImageRes.assetsFlash,
                    width: 25,
                  ),
                ),
                SizedBox(width: 10),
                // Title, distance and address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'VIN EV Changer',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            '1.5 km',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '208 Olson Boulevard, Toyburgh',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Image part
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                ImageRes.assetsParking,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParkCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon and text part
          Row(
            children: [
              // Icon
              Container(
                // padding: EdgeInsets.all(8),
                // decoration: BoxDecoration(
                //   color: Colors.orangeAccent,
                //   borderRadius: BorderRadius.circular(50),
                // ),
                child: Image.asset(
                  ImageRes.assetsPark,

                  width: 25,

                ),
              ),
              SizedBox(width: 10),
              // Title, distance and address
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Wayne Manor Parking Lot',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '1.5 km',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 4),
                  Text(
                    '208 Olson Boulevard, Toyburgh',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Image part
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // child: Image.network(
            //   'https://via.placeholder.com/80', // replace with your image URL
            //   width: 50,
            //   height: 50,
            //   fit: BoxFit.cover,
            // ),

              child: Image.asset(
                ImageRes.assetsParking,

                width: 50,
                  height: 50,
                  fit: BoxFit.cover,
              )
          ),
        ],
      ),
    );
  }
}
