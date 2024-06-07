

import 'package:checkupapp/Core/Class/crud.dart';
import 'package:checkupapp/linkApi.dart';

class QuestionData {
  Crud crud;
  QuestionData(this.crud);
  getData(String token) async {
    var response = await crud.getData(AppLink.getQuestions, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
