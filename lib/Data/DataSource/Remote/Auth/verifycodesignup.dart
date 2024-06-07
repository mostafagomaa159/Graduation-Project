

import 'package:checkupapp/Core/Class/crud.dart';
import 'package:checkupapp/linkApi.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postdata(String username ,String email,String password,String phoneNumber,String verificationCode) async {
    var response = await crud.postData(AppLink.registeration_otp, {
      "name" : username ,
      "email" : email ,
      "password" : password ,
      "phone_number" : phoneNumber ,
      "otp" : verificationCode ,
    });
    return response.fold((l) => l, (r) => r);
  }

}