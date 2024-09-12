
import '/Services/StorageServices/get_storage_services.dart';

import '/Utils/utils.dart';

import 'package:get/get.dart';




class AuthenticationController extends GetxController {





  Future<bool> logOut() async {
    showProgress();


    await AppStorage.box.remove(AppStorage.getUser);
    await AppStorage.box.remove(AppStorage.rememberMe);


    return true;

  }




}
