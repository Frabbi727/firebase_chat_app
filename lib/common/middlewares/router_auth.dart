import 'package:flutter/material.dart';
import 'package:firebase_chat/common/routes/routes.dart';
import 'package:firebase_chat/common/store/store.dart';

import 'package:get/get.dart';

/// Check if you are logged in
class RouteAuthMiddleware extends GetMiddleware {
// priority number is small and has high priority

  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 1), () => Get.snackbar("Prompt", "Login expired, please log in again"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
