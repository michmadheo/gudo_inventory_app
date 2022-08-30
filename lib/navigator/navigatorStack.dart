import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudo_inventory_app/blocs/pizza/pizza_bloc.dart';
import 'package:gudo_inventory_app/blocs/user/user_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),),
        // BlocProvider(
        //   create: (context) => PizzaBloc()..add(LoadPizzaCounter()),)
      ],
      child: MaterialApp(
          routes: {
            'LoadingScreen': (context) {
              return LoadingScreen();
            },
            'HomeContainer': (context) {
              return HomeContainer();
            },
          },
          initialRoute: 'LoadingScreen',
      ),
    );
  }
}
