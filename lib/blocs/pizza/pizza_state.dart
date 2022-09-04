part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();
  
  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {
}

class PizzaLoaded extends PizzaState {
  final List<Pizza> pizzas;
  final String brand;

  const PizzaLoaded({
    required this.pizzas,
    required this.brand,
  });

  @override
  List<Object> get props => [pizzas];
}
