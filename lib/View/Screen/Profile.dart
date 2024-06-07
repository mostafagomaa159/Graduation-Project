import 'package:checkupapp/Controller/auth/userInfo_controller.dart';
import 'package:checkupapp/Core/Class/handlingdataview.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/View/Widget/Auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/Auth/customdrawer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.white),
          ),
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: GetBuilder<UserInfoController>(
          builder: (controller) {
            return ListView(

              children: [
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LogoAuth(),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Card(
                                  child: Text(
                                "${controller.data['name']}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Card(
                                  child: Text(
                                "${controller.data['email']}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Card(
                                  child: Text(
                                "${controller.data['phone_number']}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                          const SizedBox(
                            height: 20,
                          ),
                      controller.checks.length==0?Container():
                          Expanded(
                            child: Card(
                                child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        height: 15,
                                        thickness: 5,
                                        color: AppColor.primaryColor,
                                      );
                                    },
                                    itemCount:
                                        controller.checks.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            width: 200,
                                            child: Image.network(
                                              '${controller.data['check_results'][index]['image_url']}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Text(
                                            "${controller.data['check_results'][index]['check_result']} ",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      );
                                    })),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
