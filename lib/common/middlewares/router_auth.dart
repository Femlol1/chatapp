import 'package:chatify/common/routes/routes.dart';
import 'package:chatify/common/store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// checjs if the user has loged in
class RouteAuthMiddleware extends GetMiddleware {
  // priority smaller the better
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.INITIAL ||
        route == AppRoutes.Message) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
