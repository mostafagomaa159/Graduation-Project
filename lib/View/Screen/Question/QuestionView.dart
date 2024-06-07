import 'package:checkupapp/Controller/Questions/Question_Controller.dart';
import 'package:checkupapp/Core/Class/handlingdataview.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Services/Services.dart';
import 'package:checkupapp/View/Widget/Auth/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionView extends StatelessWidget {
  QuestionView({super.key});

  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionsController());
    String? sharedPrefLang = myServices.sharedPreferance.getString("lang");

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "54".tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.white),
          ),
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: GetBuilder<QuestionsController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Padding(
                              padding:
                                  EdgeInsetsDirectional.symmetric(horizontal: 20),
                              child: Divider(
                                height: 7,
                                color: AppColor.primaryColor,
                              ),
                            );
                          },
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Card(
                                child: ListTile(
                                  leading:
                                      Text("${controller.data[index]['id']}"),
                                  title: (sharedPrefLang == "ar")
                                      ? Text(
                                          "${controller.data[index]['question_ar']}")
                                      : Text(
                                          "${controller.data[index]['question_en']}"),
                                  subtitle: Column(
                                    children: [
                                      RadioListTile(
                                        value: 1,
                                        groupValue: controller.getAnswerById(
                                            controller.data[index]['id']),
                                        onChanged: (ind) {
                                          print(
                                              "clicked True for question ${controller.data[index]['id']}");
                                          controller.answerQuestion(
                                              controller.data[index]['id'], 1);
                                        },
                                        title: const Text("True"),
                                      ),
                                      RadioListTile(
                                        value: 0,
                                        groupValue: controller.getAnswerById(
                                            controller.data[index]['id']),
                                        onChanged: (ind) {
                                          print(
                                              "clicked False for question ${controller.data[index]['id']}");
                                          controller.answerQuestion(
                                              controller.data[index]['id'], 0);
                                        },
                                        title: const Text("False"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    width: 300,
                    padding:const EdgeInsets.only(bottom: 10,top: 10),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: AppColor.primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        bool isFlag =true;
                        for (var qa in controller.answers) {
                           if( qa.answer == null){
                             isFlag=false;
                           }
                        }
                        isFlag==true?  controller.pushDataToAPI().then((value) =>  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                          duration:const Duration(seconds: 3),
                          content: Center(child: Text("The disease is  ${controller.name},Need : OCT",style:const TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold),)),
                          backgroundColor: (AppColor.grey),))):
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Center(child: Text("Please Answer all the Questions",style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold),)),
                          backgroundColor: (AppColor.grey),));
                        //controller.pushDataToAPI();

                      },
                      child: const Text("Submit"),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
