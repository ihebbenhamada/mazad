import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../config/binding/binding.dart';
import '../config/translation/translation.dart';
import '../routes/app_pages.dart';
import 'intro-screen/intro-screen.dart';
import 'main-screen/main-screen.dart';

class MazadMainApplication extends StatelessWidget {
  const MazadMainApplication(
      {Key? key, this.isLoggedIn, required this.language})
      : super(key: key);
  final bool? isLoggedIn;
  final String? language;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          translations: Translation(),
          theme: ThemeData(fontFamily: 'Poppins'),
          locale: language == 'fr'
              ? const Locale('fr', 'FR')
              : const Locale('en', 'US'),
          initialBinding: Binding(),
          smartManagement: SmartManagement.keepFactory,
          home: isLoggedIn != null ? const MainScreen() : const IntroScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
