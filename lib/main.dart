import 'package:flutter/material.dart';
import 'package:seven_pay/app_config.dart';
import 'package:seven_pay/module/address/pages/address_page.dart';

void initializeMain(AppConfig appConfig) {
  runApp(
    MyApp(title: appConfig.appName),
  );
}

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddressPage(),
    );
  }
}
