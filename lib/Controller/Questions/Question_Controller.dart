import 'dart:convert';
import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Function/handlingdatacontroller.dart';
import 'package:checkupapp/Core/Services/SharedPre.dart';
import 'package:checkupapp/Data/DataSource/Remote/Questions/AnswerQuestions_Data.dart';
import 'package:checkupapp/Data/DataSource/Remote/Questions/Question_Data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuestionsController extends GetxController {
  QuestionData questionData = QuestionData(Get.find());
  AnswerQuestionData answerQuestionData = AnswerQuestionData(Get.find());

  String? token;

  // todo you have to map the respone into list of model it will be easier to deal with
  List data = [];
  String? name;
  String? answer;
  String? id;
  late StatusRequest statusRequest;
  final List<QuestionsModel> answers = [];

  getData() async {
    String t =SharedPrefrenceHelper.getData(key: 't');
    statusRequest = StatusRequest.loading;
    var response = await questionData.getData(t);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response['data']);
      for (var element in data) {
        print(element);

        answers.add(QuestionsModel(id: element["id"]));
      }
    }
    update();
  }

  Future<http.Response> pushDataToAPI() async {
    String test=SharedPrefrenceHelper.getData(key: "t");
    final AnswerQuestionModel answerData =
    AnswerQuestionModel(questions: answers);
    final response = await http.post(
      Uri.parse("https://checkup.azad.digital/api/questions-submit"),
      headers: {'Content-Type': 'application/json', 'Authorization': test},
      body: jsonEncode(answerData.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successful response
      name = jsonDecode(response.body)['data']['category_name'];
      return response;
    } else {
      // Error handling
      throw Exception('Failed to push data: ${response.statusCode}');
    }
  }

  void answerQuestion(int questionId, int answer) {
    for (var element in answers) {
      if (element.id == questionId) {
        if (element.answer != answer) {
          element.answer = answer;
        }
      }
    }
    update();
  }

  int? getAnswerById(int id) {
    for (var qa in answers) {
      if (qa.id == id) {
        return qa.answer;
      }
    }
    // Return null if no matching id is found
    return null;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

class QuestionAnswers {
  final int id;
  int? answer;

  QuestionAnswers({
    required this.id,
    this.answer,
  });
}
