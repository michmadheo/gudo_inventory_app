part of 'warehouse_bloc.dart';

abstract class WarehouseState extends Equatable {
  const WarehouseState();
  
  @override
  List<Object> get props => [];
}

class WarehouseInitial extends WarehouseState {}

class WarehouseLoaded extends WarehouseState {
  final List<dynamic> warehouse;

  const WarehouseLoaded({
    required this.warehouse
  });

  @override
    List<Object> get props => [warehouse];
}