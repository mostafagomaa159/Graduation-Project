
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/Core/Localization/ChangeLocal.dart';
import 'package:checkupapp/View/Widget/Language/CustomBtnLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style: Theme.of(context).textTheme.headline1,),
            SizedBox(height: 20),
            CustomBtnLang(text: "2".tr,onPressed: (){
              controller.changeLang("ar");
              Get.toNamed(AppRoutes.onboarding);

            },),
            CustomBtnLang(text: "3".tr,onPressed: (){
              controller.changeLang("en");
              Get.toNamed(AppRoutes.onboarding);

            },),
          ],
        ),
        
        
      ),
    );
  }
}
