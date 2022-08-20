import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gudo_inventory_app/screens/homeContainer.dart';
import 'package:gudo_inventory_app/screens/loadingScreen.dart';

class NavigatorStack extends StatefulWidget {
  const NavigatorStack({Key? key}) : super(key: key);

  @override
  State<NavigatorStack> createState() => _NavigatorStackState();
}

class _NavigatorStackState extends State<NavigatorStack> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoadingScreen': (context){
          return LoadingScreen();
        },
        'HomeContainer': (context){
          return HomeContainer();
        },
      },
      initialRoute: 'LoadingScreen',
    );
  }
}