import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_delivery_application/pages/bottom_nav_bar.dart';
import 'package:food_delivery_application/pages/food_details_page.dart';

void main() {
  //exists some devices that need this line to work properly
  WidgetsFlutterBinding.ensureInitialized();
  //protrait mode only

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialApp(
      title: "Foodak - food delivery ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[100],
        ),
        dividerTheme: DividerThemeData(
          thickness: 2,
          color: Colors.grey[300],
          indent: 20,
          endIndent: 20,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.deepOrange,
          textColor: Colors.black,
        ),
        textTheme: TextTheme(),
        fontFamily: "OpenSans",
        useMaterial3: true,
      ),
      // home: BottomNavBar(),
      routes: {
        '/':(context) => const BottomNavBar(),
        FoodDetailsPage.routeName:(context) =>const FoodDetailsPage(),
      },
    )
        : CupertinoApp(
      title: "Foodak - food delivery ",
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(),
      home: BottomNavBar(),
    );
  }
}
