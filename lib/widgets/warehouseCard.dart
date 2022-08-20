import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WarehouseCard extends StatelessWidget {
  final String title;
  final String description;

  WarehouseCard({
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => print(title),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 20),
            width: double.infinity,
            // height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Colors.blue),
              color: Color.fromARGB(255, 99, 170, 245)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title, style: TextStyle(
                              color: Colors.white, 
                              fontWeight: FontWeight.w500,
                              fontSize: 19
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(description, style: TextStyle(
                                color: Colors.white, 
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
                      child: Icon(Icons.inventory_2_rounded, size: 40, color: Colors.white,)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}