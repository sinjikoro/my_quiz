import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/core/router/app_router.dart';

class MyQuiz extends StatelessWidget {
  const MyQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'MyQuiz',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        fontFamily: 'Zen Maru Gothic',
      ),
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}
