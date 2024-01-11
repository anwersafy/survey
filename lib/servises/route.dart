import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/screens/result_screen/result_screen.dart';

import '../screens/auth_screens/login_screen.dart';
import '../screens/home_screen/home_screen.dart';

final GoRouter router = GoRouter(
  navigatorKey: Get.key,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
      path: '/home_screen',
      pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/result_screen',
      pageBuilder: (context, state) => MaterialPage(child: ResultScreen()),
    ),


  ],
);