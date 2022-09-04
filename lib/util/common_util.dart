import 'package:gudo_inventory_app/server/server.dart';

String createApiUrl(String endpoint){
  String url = SERVER_URL+endpoint;
  return url;
}