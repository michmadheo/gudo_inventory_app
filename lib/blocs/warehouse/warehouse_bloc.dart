import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gudo_inventory_app/api/api.dart';
import 'package:gudo_inventory_app/models/warehouse_model.dart';
import 'package:gudo_inventory_app/util/common_util.dart';
import 'package:http/http.dart' as http;

part 'warehouse_event.dart';
part 'warehouse_state.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  WarehouseBloc() : super(WarehouseInitial()) {
    on<LoadWarehouse>((event, emit) async{
        var url = createApiUrl(GET_WAREHOUSE_LIST);
        var response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': event.username,
          })
          );
        if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
          print(temp['data']);
          emit(WarehouseLoaded(
            warehouse: temp['data']
            ));
        } else {
          print('Failed');
        }
    });
  }
}
