
import 'package:checkupapp/Core/Class/crud.dart';
import 'package:checkupapp/linkApi.dart';

class AnswerQuestionData {
  Crud crud;
  AnswerQuestionData(this.crud);
  postData(List answer,String token) async {
    var response = await crud.postData(AppLink.postAnswer, {
      "questions":answer,
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
}



class AnswerQuestionModel {
  List<QuestionsModel>? questions;

  AnswerQuestionModel({this.questions});

  AnswerQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <QuestionsModel>[];
      json['questions'].forEach((v) {
        questions!.add(new QuestionsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionsModel {
  int? id;
  int? answer;

  QuestionsModel({this.id, this.answer});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    return data;
  }
}
