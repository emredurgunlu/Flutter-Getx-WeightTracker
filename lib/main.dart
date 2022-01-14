import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'controller/binding.dart';
import 'controller/controller.dart';
import 'uı/screens/calculation.dart';
import 'uı/screens/history.dart';
import 'uı/screens/weight.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: "Weight Tracker",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    Widget screen = const Weight();
    String appbarTitle = "MY CURRENT WEIGHT";

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle),
          centerTitle: true,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: c.threeColor.value,
          index: 1,
          items: const <Widget>[
            Icon(Icons.show_chart, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.history, size: 30),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                screen = const Calculation();
                appbarTitle = "CALCULATE NUTRITIONAL VALUE";
                c.threeColor.value = Colors.red;
                break;
              case 1:
                screen = const Weight();
                appbarTitle = "MY CURRENT WEIGHT";
                c.threeColor.value = Colors.indigo;
                break;
              default:
                {
                  screen = const History();
                  appbarTitle = "MY WEIGHT HISTORY";
                  c.threeColor.value = Colors.green;
                }
            }
          },
        ),
        body: screen,
      ),
    );
  }
}
