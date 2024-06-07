
import 'package:checkupapp/Controller/auth/forgetpassword_controller.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/View/Widget/Auth/customtextbodyauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextformauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/Auth/custombuttonauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text('15'.tr,
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
             CustomTextTitleAuth(text: "28".tr),
            const SizedBox(height: 10),
             CustomTextBodyAuth(
                text:
                "30".tr),
            const SizedBox(height: 15),
            CustonTextFormAuth(
              isNumber: false,
              valid: (val) {},
              mycontroller: controller.email,
              hinttext: "13".tr,
              iconData: Icons.email_outlined,
              labeltext: "19".tr,
              // mycontroller: ,
            ),
            CustomButtomAuth(text: "31".tr, onPressed: () {
              controller.goToVerfiyCode();
            }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
