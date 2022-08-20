import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeTracking extends StatefulWidget {
  const HomeTracking({Key? key}) : super(key: key);

  @override
  State<HomeTracking> createState() => _HomeTrackingState();
}

class _HomeTrackingState extends State<HomeTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text('Tracking History', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
      ),
    );
  }
}