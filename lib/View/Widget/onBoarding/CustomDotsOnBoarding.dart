
import 'package:checkupapp/Controller/Controller_onBoarding.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Data/DataSource/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotonBoarding extends StatelessWidget {
  const CustomDotonBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<OnBoardingControllerImp>(builder: (controller)=> Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoardingList.length,
                (index) => AnimatedContainer(
              margin: EdgeInsets.only(right: 5),
              duration: Duration(milliseconds: 700),
              width: controller.currentpage==index? 20 :5,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ))
      ],
    ));
  }
}
