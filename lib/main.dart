import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/pages/create_post_page.dart';
import 'package:getx/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      getPages: [
        GetPage(name: Create_post.id, page: () => Create_post()),
        GetPage(name: Home.id, page: () => Home()),
      ],
    );
  }
}
