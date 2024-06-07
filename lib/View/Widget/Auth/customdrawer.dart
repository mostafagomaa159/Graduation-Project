import 'package:checkupapp/Controller/auth/logout_controller.dart';
import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Constant/routes.dart';
import 'package:checkupapp/View/Screen/Profile.dart';
import 'package:checkupapp/View/Screen/Question/QuestionView.dart';
import 'package:checkupapp/View/Screen/upload_image/upload_image.dart';
import 'package:checkupapp/View/Widget/Auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(logOutControllerImp());
    return Drawer(
        child: GetBuilder<logOutControllerImp>(
          builder: (controller) => controller.statusRequest == StatusRequest.loading
              ? const Center(
            child: Text("Loading..."),
          )
              : ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(child: LogoAuth()),
                accountEmail: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('Eyes Detection'),
                ),
                accountName: Text(
                  'CheckUp',
                  style:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Get.offNamed(AppRoutes.homepage);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline_outlined),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.fact_check_outlined),
                title: const Text(
                  'CheckUp Questionnaire',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionView()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.cloud_upload_outlined),
                title: const Text(
                  'Upload OCT',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Get.offNamed(AppRoutes.UploadImage);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  controller.logout().then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Center(
                            child: Text(
                              "56".tr,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        backgroundColor: (AppColor.grey),
                      )));
                },
              ),
            ],
          ),
        ));
  }
}
