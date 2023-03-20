import 'package:dashboard/models/sector_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SectoresProvider extends ChangeNotifier {
  final url = Uri.http('127.0.0.1:8090', '/api/collections/sector/records',
      {'expand': 'sucursal'});

  SectoresProvider() {
    getSectores();
  }

  getSectores() async {
    final response = await http.get(url);
    final data = SectorResponse.fromJson(response.body);
    print(data.items[0].expand?.sucursal.nombre);
  }
}
