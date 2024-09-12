import 'package:darasni/Controllers/AuthenticationController/auth_controller.dart';


import 'package:darasni/Controllers/Booking%20Controller/booking_controller.dart';



import 'package:darasni/main.dart';
import 'package:get/get.dart';

void putControllers() {
  Get.put(ThemeController());



  Get.put(AuthenticationController());
  Get.put(BookingController());

}

ThemeController themeController = Get.find<ThemeController>();


AuthenticationController authController = Get.find<AuthenticationController>();
BookingController bookingController = Get.find<BookingController>();


