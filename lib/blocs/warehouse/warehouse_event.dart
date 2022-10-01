part of 'warehouse_bloc.dart';

abstract class WarehouseEvent extends Equatable {
  const WarehouseEvent();

  @override
  List<Object> get props => [];
}

class LoadWarehouse extends WarehouseEvent {
  final String username;

  const LoadWarehouse({
    required this.username
  });
}
