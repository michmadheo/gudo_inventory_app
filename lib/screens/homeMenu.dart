import 'package:flutter/material.dart';
import 'package:gudo_inventory_app/widgets/lastActivityCard.dart';
import 'package:gudo_inventory_app/widgets/warehouseCard.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Hello, User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: const Text('Welcome to your warehouse', style: TextStyle(fontWeight: FontWeight.w300)),
                  )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: Text('Last Activity', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
          ),
          LastActivityCard(activityStatus: 'add',),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 10,
            color: Colors.grey[200]
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text('Your Warehouse', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
          ),
          WarehouseCard(
            title: 'Central Warehouse', 
            description: 'Central warehouse for all inventory',
          ),
          WarehouseCard(
            title: 'Sorting Center', 
            description: 'Sorting Center in Bekasi',
          ),
          WarehouseCard(
            title: 'Delivery Center', 
            description: 'Delivery Center in Bekasi',
          ),
        ],
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        )
      ),
    );
  }
}