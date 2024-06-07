
import 'package:checkupapp/Controller/auth/resetpassword_controller.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Function/validinput.dart';
import 'package:checkupapp/View/Widget/Auth/custombuttonauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextbodyauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextformauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text('44'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
             CustomTextTitleAuth(text: "45".tr),
            const SizedBox(height: 10),
             CustomTextBodyAuth(
                text:
                    "46".tr),
            const SizedBox(height: 15),
            CustonTextFormAuth(
              isNumber: false ,
              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hinttext: "14".tr,
              iconData: Icons.lock_outline,
              labeltext: "Password",
              // mycontroller: ,
            ),   CustonTextFormAuth(
              isNumber: false ,

              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hinttext: "47".tr,
              iconData: Icons.lock_outline,
              labeltext: "Password",
              // mycontroller: ,
            ),
            CustomButtomAuth(text: "34".tr, onPressed: () {

              controller.goToSuccessResetPassword();
            }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
