

import 'package:checkupapp/Core/Class/crud.dart';
import 'package:checkupapp/linkApi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String email  ,String password,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "name" : username ,
      "email" : email ,
      "password" : password  ,
      "phone_number" : phone  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}

