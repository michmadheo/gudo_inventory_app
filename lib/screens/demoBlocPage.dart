import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pizza/pizza_bloc.dart';
import '../models/pizza_model.dart';

class DemoBlocPage extends StatefulWidget {
  const DemoBlocPage({Key? key}) : super(key: key);

  @override
  State<DemoBlocPage> createState() => _DemoBlocPageState();
}

class _DemoBlocPageState extends State<DemoBlocPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => PizzaBloc()..add(LoadPizzaCounter()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return Text('Loading');
            }
            if (state is PizzaLoaded) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${state.pizzas.length}'),
                    Text('${state.brand}'),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<PizzaBloc>()
                              .add(AddPizza(pizza: Pizza.pizzas[1]));
                        },
                        child: Text('ow'))
                  ],
                ),
              );
            } else {
              return Text('Error');
            }
          },
        ),
        floatingActionButton:
          Container(child: BlocBuilder<PizzaBloc, PizzaState>(
            builder: (context, state) {
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  context.read<PizzaBloc>().add(AddPizza(pizza: Pizza.pizzas[1]));
              },
            );
          },
        )),
      ),
    );
  }
}
