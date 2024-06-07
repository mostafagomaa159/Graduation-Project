import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Function/handlingdatacontroller.dart';
import 'package:checkupapp/Core/Services/SharedPre.dart';
import 'package:checkupapp/Data/DataSource/Remote/Auth/userInfo.dart';
import 'package:get/get.dart';



class UserInfoController extends GetxController {

  UserInfoData userInfoData = UserInfoData(Get.find());
  // todo you have to map the respone into list of model it will be easier to deal with
  Map data = {};
  List<dynamic> checks=[];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await userInfoData.getData(SharedPrefrenceHelper.getData(key: 't'));
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response['data']);
      checks.addAll(response['data']['check_results']);
    }
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
