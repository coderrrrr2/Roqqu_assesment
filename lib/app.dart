import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:roqqu_assesment/core/utils/theme.dart';
import 'package:roqqu_assesment/features/navigation/app_pages.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: AppPages.initialRoute,
        getPages: AppPages.pages,
      ),
    );
  }
}
