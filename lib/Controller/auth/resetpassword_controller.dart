
import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/Core/Function/handlingdatacontroller.dart';
import 'package:checkupapp/Data/DataSource/Remote/Auth/ResetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  String? email;
  String? otp;
  late TextEditingController password;
  late TextEditingController repassword;
  StatusRequest? statusRequest;
  ResetPassword resetPassword=ResetPassword(Get.find());
  @override

  resetpassword() {}

  @override
  goToSuccessResetPassword() async{

    if (formstate.currentState!.validate()) {

      statusRequest = StatusRequest.loading;
      var response = await resetPassword.postdata(email!,password.text,otp!);
      print("!!=============================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {

        Get.offNamed(AppRoutes.successResetpassword);
      }
      update();

    } else {
      Get.defaultDialog(
          title: "ُWarning", middleText: "Failed Password");
      statusRequest = StatusRequest.failure;
      print("Not Valid");
    }
  }

  @override
  void onInit() { 
    password = TextEditingController(); 
    repassword = TextEditingController();
    email = Get.arguments['email'];
    otp = Get.arguments['otp'];
    super.onInit();
  }

  @override
  void dispose() { 
    password.dispose(); 
    repassword.dispose(); 
    super.dispose();
  }
}
