
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/Core/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find() ;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferance.getString("onboarding") == "1"){
      return const RouteSettings(name: AppRoutes.login) ;
    }
  }
}