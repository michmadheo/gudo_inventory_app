import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gudo_inventory_app/api/api.dart';
import 'package:gudo_inventory_app/util/common_util.dart';

import '../../models/pizza_model.dart';
import 'package:http/http.dart' as http;

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>((event, emit) async{
      // await Future.delayed(const Duration(seconds: 2),(){
      //   emit(const PizzaLoaded(pizzas: <Pizza>[]));
      // });
      var url = createApiUrl(APP_DESCRIPTION);
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
        emit(
          PizzaLoaded(
          pizzas: <Pizza>[],
          brand: temp['message']
        ));
      } else {
        print('Failed');
      }
    });
    on<AddPizza>((event, emit) {
      if(state is PizzaLoaded){
        final state = this.state as PizzaLoaded;
        emit(
          PizzaLoaded(
            pizzas: List.from(state.pizzas)..add(event.pizza),
            brand: 'WEW'
          ),
        );
      }
    });
    on<RemovePizza>((event, emit) {
      if(state is PizzaLoaded){
        final state = this.state as PizzaLoaded;
        emit(
          PizzaLoaded(
            pizzas: List.from(state.pizzas)..remove(event.pizza),
            brand: 'WOW'
          ),
        );
      }
    });
  }

  static void dispatch(LoadPizzaCounter loadPizzaCounter) {}
}
