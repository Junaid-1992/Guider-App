import '/Controllers/Booking%20Controller/booking_controller.dart';
import '/strings_and_const.dart';
import '/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooselocaionPage extends StatefulWidget {
  const ChooselocaionPage({super.key});

  @override
  State<ChooselocaionPage> createState() => _ChooselocaionPageState();
}

class _ChooselocaionPageState extends State<ChooselocaionPage> {
  String? filterValue;

  @override
  void initState() {
    super.initState();
    // _showBottomModal(context);
    Future.delayed(Duration.zero, () {
      _showBottomModals(context);
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
                  // boundaryMargin: EdgeInsets.all(100),
                  minScale: 1.0,
                  maxScale: 1.0,
                  child: Image.asset(
                    'assets/Map.png', // Replace with your map image
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 1.5,
                    height: MediaQuery.of(context).size.height * 1.5,
                  ),
                ),
                Positioned(
                  right: 0, // Distance from the left edge
                  top: MediaQuery.of(context).size.height * 0.5 - 25, // Vertical center with 25 as half of the icon height
                  child: GestureDetector(
                    onTap: () {
                      _showBottomModals(context);

                      // Add your onTap logic here
                    },
                    child: Image.asset(
                      ImageRes.assetsGuide,
                     width: 120,
                    ),
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
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Car Option (selected)
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1), // light blue background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.directions_car, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(
                      "25 min",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Scooter Option
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1), // light grey background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.electric_scooter, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      "25 min",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // Bicycle Option
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1), // light grey background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.directions_bike, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      "25 min",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 , top: 20),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      '25 min(15 km)',
                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
              Row(
                crossAxisAlignment:  CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [



                  Text(
                    'Fastest Route now due to traffic conditions',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
              const SizedBox(height: 20,),


            Column(
              children: [

                RowItem(

                  icon: Icons.circle,
                  iconColor: Colors.blue,
                  title: 'My location',
                  showDashedLine: true,
                ),


                RowItem(
                  icon: Icons.local_parking,
                  iconColor: Colors.red,
                  title: 'Wayne Manor Parking Lot',
                  showDashedLine: false, // No dashed line after the last item
                ),
              ],
            ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Add your onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0Xff598EF7), // Set the background color
                  padding: EdgeInsets.symmetric(horizontal:140, vertical: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  ),
                  elevation: 2,
                  // Elevation to give the button a raised effect
                ),
                child: Text(
                  "Let's go",
                  style: TextStyle(
                    fontSize: 18, // Set font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color
                  ),
                ),
              ),



            ],
          ),
        );
      },
    );
  }

  void _showBottomModals(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              GestureDetector(
                onTap: (){
                  _showBottomModal(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Car Option (selected)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1), // light blue background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.directions_car, color: Colors.blue),
                          SizedBox(width: 5),
                          Text(
                            "25 min",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Scooter Option
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1), // light grey background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.electric_scooter, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            "25 min",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bicycle Option
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1), // light grey background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.directions_bike, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            "25 min",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 , top: 20),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      '25 min(15 km)',
                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
              Row(
                crossAxisAlignment:  CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [



                  Text(
                    'Fastest Route now due to traffic conditions',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
              const SizedBox(height: 20,),





            ],
          ),
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




class RowItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final bool showDashedLine;

  RowItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.showDashedLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [

              Container(

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                ),
              ),

              // Optional Dashed Line
              if (showDashedLine)
                CustomPaint(
                  size: Size(1, 40),
                  painter: DashedLinePainter(),
                ),
            ],
          ),

          SizedBox(width: 10),

          // Title and Icon on Right
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[100]!,  // Setting the border color
                  width: 1.0,  // You can set the width of the border here
                ),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Dots Icon on the right
                  Icon(
                    Icons.drag_handle,
                    color: Colors.grey,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
