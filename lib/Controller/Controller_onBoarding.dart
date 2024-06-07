
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/Core/Services/Services.dart';
import 'package:checkupapp/Data/DataSource/Static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController{
  late PageController pageController;
  int currentpage=0;

  MyServices myServices =Get.find();
  @override
  next() {
    currentpage++;
    if(currentpage >onBoardingList.length-1){
      myServices.sharedPreferance.setString("onBoarding", "1");
      Get.offAllNamed(AppRoutes.login);

    }else{
      pageController.animateToPage(currentpage, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);

    }

  }

  @override
  onPageChanged(int index) {
    currentpage=index;
    update();


  }
  @override
  void onInit() {
pageController=PageController();
    super.onInit();
  }
  
}