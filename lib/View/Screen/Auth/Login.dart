
import 'package:checkupapp/Controller/auth/login_controller.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Function/alertexitapp.dart';
import 'package:checkupapp/Core/Function/validinput.dart';
import 'package:checkupapp/View/Widget/Auth/custombuttonauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextbodyauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtextformauth.dart';
import 'package:checkupapp/View/Widget/Auth/customtexttitleauth.dart';
import 'package:checkupapp/View/Widget/Auth/logoauth.dart';
import 'package:checkupapp/View/Widget/Auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text('10'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),

      body:WillPopScope(
        onWillPop: alertExitApp,
        child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const LogoAuth(),
              const SizedBox(height: 20),
               CustomTextTitleAuth(text:"11".tr),
              const SizedBox(height: 10),
               CustomTextBodyAuth(text:"12".tr),
              const SizedBox(height: 15),
              CustonTextFormAuth(
                isNumber: false ,

                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },

                mycontroller: controller.email,
                hinttext: "13".tr,
                iconData: Icons.email_outlined,
                labeltext: "19".tr,
                // mycontroller: ,
              ),
             GetBuilder<LoginControllerImp>(builder: (controller)=> CustonTextFormAuth(
               obscureText: controller.isShowPassword,
               onTapIcon: (){
                 controller.showPassword();
               },
               isNumber: false ,

               valid: (val) {
                 return validInput(val!, 5, 30, "password");
               },
               mycontroller: controller.password,
               hinttext: "14".tr,
               iconData:controller.isShowPassword? Icons.visibility:Icons.visibility_off,
               labeltext: "20".tr,
               // mycontroller: ,
             ),),
              InkWell(
                onTap: (){
                  controller.goToForgetPassword();
                },
                child:Text(
                  "15".tr,
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtomAuth(text: "10".tr, onPressed: () {
                controller.login();
              }),
              const SizedBox(height: 40),
              CustomTextSignUpOrSignIn(
                textone: "17".tr,
                texttwo: "40".tr,
                onTap: () {
                  controller.goToSignUp();
                },
              )
            ]),
          ),
        ),
      )
    );
  }
}