import 'package:checkupapp/Controller/auth/signup_controller.dart';
import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Function/alertexitapp.dart';
import 'package:checkupapp/Core/Function/validinput.dart';
import 'package:checkupapp/View/Widget/Auth/custombuttonauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextbodyauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextformauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtexttitleauth.dart';
import 'package:checkupapp/View/Widget/Auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text('18'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? const Center(
                        child: Text("Loading..."),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 20),
                            CustomTextTitleAuth(text: "11".tr),
                            const SizedBox(height: 10),
                            CustomTextBodyAuth(text: "25".tr),
                            const SizedBox(height: 15),
                            CustonTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 20, "username");
                              },
                              mycontroller: controller.username,
                              hinttext: "24".tr,
                              iconData: Icons.person_outline,
                              labeltext: "21".tr,
                              // mycontroller: ,
                            ),
                            CustonTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 40, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "13".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "19".tr,
                            ),
                            CustonTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 7, 11, "phone");
                              },
                              mycontroller: controller.phone,
                              hinttext: "23".tr,
                              iconData: Icons.phone_android_outlined,
                              labeltext: "22".tr,
                            ),
                            CustonTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              mycontroller: controller.password,
                              obscureText: controller.isShowPassword,
                              hinttext: "14".tr,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              iconData: controller.isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              labeltext: "20".tr,
                            ),
                            CustomButtomAuth(
                                text: "18".tr,
                                onPressed: () {
                                  controller.signUp().then((value) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration: const Duration(seconds: 2),
                                        content: Center(
                                            child: Text(
                                          "29".tr,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        backgroundColor: (AppColor.grey),
                                      )));
                                }),
                            const SizedBox(height: 40),
                            CustomTextSignUpOrSignIn(
                              textone: "26".tr,
                              texttwo: "27".tr,
                              onTap: () {
                                controller.goToSignIn();
                              },
                            ),
                          ]),
                        ),
                      ),
          )),
    );
  }
}
