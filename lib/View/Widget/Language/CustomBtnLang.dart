
import 'package:checkupapp/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomBtnLang extends StatelessWidget {
  const CustomBtnLang({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(onPressed:onPressed,
        color: AppColor.primaryColor,
        textColor: AppColor.white,
        child: Text("$text",
          style:const TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
