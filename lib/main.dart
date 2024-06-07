
import 'package:checkupapp/Core/Services/SharedPre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Bindings/intialbindings.dart';
import 'Core/Localization/ChangeLocal.dart';
import 'Core/Localization/Translation.dart';
import 'Core/Services/Services.dart';
import 'Routes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initialSercies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'CheckUp Application',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // home: const Language(),
      // routes: routes,
      getPages: routes,
    );
  }
}
