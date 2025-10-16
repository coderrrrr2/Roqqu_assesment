import 'package:get/get.dart';

class AppNavigator {
  static void pushRoute(String routeName, {dynamic arguments}) {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    Get.toNamed(routeName, arguments: arguments);
  }

  static void replaceRoute(String routeName, {dynamic arguments}) {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Get.offNamed(routeName, arguments: arguments);
  }

  static Future<void> replaceAllRoutes(
    String routeName, {
    dynamic arguments,
  }) async {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  static void popRoute({dynamic result}) {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Get.back(result: result);
  }

  static bool canPopRoute() {
    if (Get.isDialogOpen ?? false) {
      Get.back(); // This will close the current dialog
    }
    return Get.key.currentState?.canPop() ?? false;
  }

  static void popUntilFirstRoute() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Get.until((route) => route.isFirst);
  }

  static void popUntilRoute(String routeName) {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Get.until((route) => route.settings.name == routeName);
  }

  static void popDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
