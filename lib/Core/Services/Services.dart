import 'package:checkupapp/Core/Services/SharedPre.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyServices extends GetxService{
  late SharedPreferences  sharedPreferance;

  Future<MyServices> init()async{

    sharedPreferance = await SharedPreferences.getInstance();
    return this;
  }



}


initialSercies ()async{
  SharedPrefrenceHelper.init();
 await Get.putAsync(() => MyServices().init());
}