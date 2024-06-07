import 'package:checkupapp/Core/Class/crud.dart';
import 'package:checkupapp/linkApi.dart';

class ForgetPasswordEmail {
  Crud crud;
  ForgetPasswordEmail(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.send_otp_for_reset_password, {
      "email" : email ,

    });
    return response.fold((l) => l, (r) => r);
  }
}