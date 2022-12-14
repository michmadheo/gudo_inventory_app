import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudo_inventory_app/blocs/pizza/pizza_bloc.dart';
import 'package:gudo_inventory_app/screens/demoBlocPage.dart';
import 'package:gudo_inventory_app/screens/homeMenu.dart';
import 'package:gudo_inventory_app/screens/homeProfile.dart';
import 'package:gudo_inventory_app/screens/homeTracking.dart';

import '../models/pizza_model.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int currentIndex = 0;
  List<Widget>screens = [
    HomeMenu(), 
    HomeTracking(), 
    // DemoBlocPage()
    HomeProfile()
    ];

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Tracking'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile'
          )
        ],
      ),
      body: screens[currentIndex]
    );
  }
}