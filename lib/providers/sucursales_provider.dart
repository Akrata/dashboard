import 'package:dashboard/models/sucursal_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SucursalesProvider extends ChangeNotifier {
  final url =
      Uri.http('127.0.0.1:8090', '/api/collections/sucursal/records', {});

  List<Sucursal> listaSucursales = [];

  SucursalesProvider() {
    getSectores();
  }

  getSectores() async {
    final response = await http.get(url);
    final data = SucursalResponse.fromJson(response.body);
    print(data.items[0].nombre);
    listaSucursales = data.items;
    notifyListeners();
  }
}
