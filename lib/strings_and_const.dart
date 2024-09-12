class AppConst {
  static const String TUTOR_ROLE = "Tutor";
  static const String STUDENT_ROLE = "Student";
  static const String INSTITUTE_ROLE = "Institute";

  static List<TeachingsWay> teachingWayList = <TeachingsWay>[
    TeachingsWay("Online Sessions", "os"),
    TeachingsWay("Physical Session", "ps"),
    TeachingsWay("Both", "both")
  ];
}

class ImageRes {
  static const String assetsAppLogo = 'assets/appLogo.png';
  static const String assetBackground = 'assets/background.png';
  static const String assetsIntroImage2 = 'assets/intro_image_2.png';
  static const String assetsIntroImage1 = 'assets/intro_image_1.png';
  static const String assetsIntroImage3 = 'assets/intro_image_3.png';
  static const String assetsIntroImage4 = 'assets/bee.png';
  static const String assetsRecaptcha = 'assets/recaptcha.png';
  static const String assetsSideMenu = 'assets/side_menu.png';
  static const String assetsProfileLogo = 'assets/profile_logo.png';
  static const String assetsBookMark = 'assets/bookMark.png';
  static const String assetsHome = 'assets/Home.png';
  static const String assetsCoaches = 'assets/Coach.png';
  static const String assetsCourse = 'assets/courses.png';
  static const String assetsCart = 'assets/cart.png';
  static const String assetsLogoWhite = 'assets/logoWhite.png';
  static const String assetsPinLocation = 'assets/pin_location.png';
  static const String assetsVerifiedUser = 'assets/verified_user.png';
  static const String assetsBankDetail = 'assets/bank_detail.png';
  static const String assetsFilterIcon = 'assets/filterIcon.png';
  static const String assetsCardPaymentIcon = 'assets/card_payment.png';
  static const String assetsPaypalIcon = 'assets/paypal.png';
  static const String assetsFacebookIcon = 'assets/facebook.png';
  static const String assetsTwitterIcon = 'assets/twitter.png';
  static const String assetsLinkedinIcon = 'assets/linkedin.png';
  static const String assetsInstagramIcon = 'assets/instagram.png';
  static const String eggIcon = 'assets/egg.png';
  static const String ic_whatsapp = 'assets/ic_whatsapp.png';
  static const String ic_face_id = 'assets/ic_face_id.png';




  static const String assetsCompass = 'assets/compass.png';
  static const String assetsCalender = 'assets/calender.png';
  static const String assetsSchedule = 'assets/schedule.png';
  static const String assetsGuide = 'assets/guideicon.png';
  static const String assetsBook = 'assets/book.png';
  static const String assetsChat = 'assets/chat.png';
  static const String assetsAccount = 'assets/account.png';
  static const String assetsLocation = 'assets/location.png';
  static const String assetsPin = 'assets/pin.png';
  static const String assetsKmart = 'assets/Kmart.png';
  static const String assetsEvvin = 'assets/evvin.png';
  static const String assetsVchar = 'assets/Vchar.png';
  static const String assetsPlus = 'assets/plus.png';
  static const String assetsParking = 'assets/parking.png';
  static const String assetsFlash = 'assets/flash.png';
  static const String assetsPark = 'assets/park.png';
  static const String assetsBottomNav = 'assets/bottomnav.png';
}

///
class TeachingsWay {
  String title;
  String value;

  TeachingsWay(this.title, this.value);
}
