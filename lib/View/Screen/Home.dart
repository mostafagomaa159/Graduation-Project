import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Constant/ImageAsset.dart';
import 'package:checkupapp/View/Widget/Auth/customdrawer.dart';
import 'package:checkupapp/View/Widget/HomePage/CustomBtnHomePage.dart';

import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CheckUp",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.white),
        ),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("${AppImageAsset.homepagebg}"),
              fit: BoxFit.fill,
            )),
        child: ListView(

          children: [
            const   Text(
              "  Check Up \n services, Here you can find \n your Supporter AI doctor \n to pre check up for your Eye illness,\n By Questions that Analyse the Current Ill,\n And Recommend most needed X-Ray\n to detect the ill perfectly,\n After Uploading X-ray image\n The AI Model will detect the ill\n and give you suitable Advice for your Situation ",
              style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25, color: AppColor.black),
            ),

          ],
        ),
      )
    );
  }
}
