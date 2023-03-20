// To parse this JSON data, do
//
//     final sucursalResponse = sucursalResponseFromMap(jsonString);

import 'dart:convert';

class SucursalResponse {
  SucursalResponse({
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  int page;
  int perPage;
  int totalPages;
  int totalItems;
  List<Sucursal> items;

  factory SucursalResponse.fromJson(String str) =>
      SucursalResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SucursalResponse.fromMap(Map<String, dynamic> json) =>
      SucursalResponse(
        page: json["page"],
        perPage: json["perPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
        items:
            List<Sucursal>.from(json["items"].map((x) => Sucursal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "perPage": perPage,
        "totalPages": totalPages,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Sucursal {
  Sucursal({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.nombre,
  });

  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String nombre;

  factory Sucursal.fromJson(String str) => Sucursal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sucursal.fromMap(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "nombre": nombre,
      };
}
