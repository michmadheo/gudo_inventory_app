import 'package:equatable/equatable.dart';

class Pizza extends Equatable{
  final String id;
  final String name;

  const Pizza({
    required this.id,
    required this.name,
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [id, name];

  static List<Pizza> pizzas = [
    Pizza(
      id: '0',
      name: 'Pizza'
    ),
    Pizza(
      id: '1',
      name: 'Pizza Pepperoni'
    ),
  ];
}