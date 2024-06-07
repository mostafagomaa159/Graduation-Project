
import 'package:checkupapp/Controller/Controller_onBoarding.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBtnonBoarding extends GetView<OnBoardingControllerImp> {
  const CustomBtnonBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      margin: EdgeInsets.only(bottom: 40),
      child: MaterialButton(onPressed: (){
        controller.next();
      },
        child:Text("e".tr),
        padding: EdgeInsets.symmetric(horizontal: 100),
        color: AppColor.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
