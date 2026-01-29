import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'account_page.dart';
import 'favorites_page.dart';
import 'home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> bodyOptions = [HomePage(), FavoritesPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget? appBar;
    if (Platform.isAndroid) {
      appBar = AppBar(title: const Text("Foodak"));
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(
        middle: const Text("Foodak"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      );
    } else {
      appBar = null;
    }
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: const Drawer(child: Center(child: Text("in the drawer"))),
        backgroundColor: Colors.white,
        body: bodyOptions[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "account",
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (index) => onItemTapped(index),
        ),
      ),
    );
  }
}
