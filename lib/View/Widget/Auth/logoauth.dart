
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:checkupapp/Core/Constant/ImageAsset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70,
        backgroundColor: AppColor.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(AppImageAsset.logo!),
          ),
        ));
  }
}
