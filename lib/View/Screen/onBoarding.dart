
import 'package:checkupapp/Controller/Controller_onBoarding.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Localization/ChangeLocal.dart';
import 'package:checkupapp/View/Widget/onBoarding/CustomBtn.dart';
import 'package:checkupapp/View/Widget/onBoarding/CustomDotsOnBoarding.dart';
import 'package:checkupapp/View/Widget/onBoarding/CustomSlideronBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoarding extends StatelessWidget {
   onBoarding({super.key});
  LocaleController controller = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    print(controller.language);
    return const Scaffold(
      backgroundColor: AppColor.white,
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: CustomSlideronBoarding(),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomDotonBoarding(),
              Spacer(flex: 2),
              CustomBtnonBoarding(),
            ],
          ),
        ),
      ],
    )));
  }
}
