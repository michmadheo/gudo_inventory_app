import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LastActivityCard extends StatelessWidget {

  final String activityStatus;

  LastActivityCard({
    required this.activityStatus
  });

  @override
  Widget build(BuildContext context) {
    String statusName = 'add';

    Color? cardColor(String status){
      if(status =='add'){
        return Color.fromARGB(255, 192, 234, 246);
      }
      if(status =='transfer'){
        return Colors.green[100];
      }
      if(status =='remove'){
        return Colors.red[100];
      }
    }

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 10, right: 20),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardColor(activityStatus),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          ),
        ),
      ],
    );
  }
}