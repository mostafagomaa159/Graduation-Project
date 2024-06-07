
import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/Core/Function/handlingdatacontroller.dart';
import 'package:checkupapp/Data/DataSource/Remote/Auth/ForgetPasswordEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  StatusRequest? statusRequest;
  late TextEditingController email;
  List data=[];
  ForgetPasswordEmail forgetpasswordemail=ForgetPasswordEmail(Get.find());
  @override
  checkemail() {}

  @override
  goToVerfiyCode()async {

    if (formstate.currentState!.validate()) {

      statusRequest = StatusRequest.loading;
      var response = await forgetpasswordemail.postdata(email.text);
      print("!!!=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offNamed(AppRoutes.verfiyCode, arguments: {
          "email": email.text,
        });
      }
      else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Please Enter Your Email");
        statusRequest = StatusRequest.failure;
        print("Not Valid");
      }
      update();

    }
  }

  @override
  void onInit() { 
    email = TextEditingController(); 
    super.onInit();
  }

  @override
  void dispose() { 
    email.dispose(); 
    super.dispose();
  }
}
