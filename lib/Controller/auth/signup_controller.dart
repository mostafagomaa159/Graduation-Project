
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/Core/Function/handlingdatacontroller.dart';
import 'package:checkupapp/Data/DataSource/Remote/Auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Class/statusrequest.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
   StatusRequest? statusRequest;
  bool isShowPassword = true;
  SignupData signupData = SignupData(Get.find());

  List data = [];
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
  @override
  signUp() async{
    if (formstate.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(username.text, email.text, password.text, phone.text);

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offNamed(AppRoutes.verifyCodeSignUp, arguments: {
          "name" : username.text,
          "email": email.text,
          "password" : password.text  ,
          "phone_number" : phone.text  ,
        });
      }
        else {
          Get.defaultDialog(title: "Warning", middleText: "Phone Number or Email already exist");
          statusRequest = StatusRequest.failure ;
        }

      update();

    }
    else {
      print("Not Valid");
    }
  }


  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController() ; 
    phone = TextEditingController() ; 
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
