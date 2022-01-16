import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zireh_project/core/router/zireh_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: 'IRANSans',
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Zireh',
      locale: const Locale('fa', 'IR'),
      getPages: ZirehPage.routes,
      initialRoute: ZirehPage.initial,
    );
  }
}
