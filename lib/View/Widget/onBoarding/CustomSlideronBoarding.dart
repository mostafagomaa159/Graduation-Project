
import 'package:checkupapp/Controller/Controller_onBoarding.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Data/DataSource/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlideronBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSlideronBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const   SizedBox(height: 30),
              Image.asset(
                onBoardingList[index].image!,
               // width: 300,
                height: Get.width/1.3,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              Text(
                onBoardingList[index].title!,
                style:const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
              ),
              const  SizedBox(height: 60),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[index].body!,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      height: 2,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          );
        });
  }
}
