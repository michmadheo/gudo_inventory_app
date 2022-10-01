import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudo_inventory_app/blocs/pizza/pizza_bloc.dart';
import 'package:gudo_inventory_app/blocs/warehouse/warehouse_bloc.dart';
import 'package:gudo_inventory_app/models/warehouse_model.dart';
import 'package:gudo_inventory_app/widgets/lastActivityCard.dart';
import 'package:gudo_inventory_app/widgets/warehouseCard.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (blocContext) => WarehouseBloc()..add(LoadWarehouse(username: 'test@gmail.com')),
        ),
        BlocProvider(
          create: (blocContext) => PizzaBloc()..add(LoadPizzaCounter()),
        )
      ],
      child: Scaffold(
        body: BlocBuilder <WarehouseBloc, WarehouseState>(
          builder: (context, state) {
            return ListView(
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
                        ),
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
                if(state is WarehouseLoaded)
                  ...state.warehouse.map((item)=>
                  WarehouseCard(
                    title: item['title'],
                    description: item['description'],
                  )
                ).toList()
                // BlocBuilder <PizzaBloc, PizzaState>(
                //   builder: (context, state) => 
                //   state is PizzaLoaded ? Text(state.brand) : Text('waw'),
                // ),
              ],
            );
          }
        ),
        floatingActionButton: Container(
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){},
          )
        ),
      ),
    );
  }
}