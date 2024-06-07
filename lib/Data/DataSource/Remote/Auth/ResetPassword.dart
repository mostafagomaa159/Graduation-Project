import 'package:checkupapp/Core/Class/crud.dart';
import 'package:checkupapp/linkApi.dart';

class ResetPassword {
  Crud crud;
  ResetPassword(this.crud);
  postdata(String email,String password,String otp) async {
    var response = await crud.postData(AppLink.reset_password, {
      "email" : email ,
      "password" : password ,
      "otp" : otp ,

    });
    return response.fold((l) => l, (r) => r);
  }
}