import 'package:equatable/equatable.dart';

class Warehouse extends Equatable{
  final String title;
  final String description;

  const Warehouse({
    required this.title,
    required this.description,
  });
  
  @override
  // TODO: implement props
  List<Object> get props => [title, description];

  static List<Warehouse> pizzas = [];
}