import 'dart:convert';
import 'package:api_13_test_2nd/API_Connection/Connections.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import '../Model/ProductModel.dart';

class ConnectionFunction {
  List<Data> products = [];

  Future<void> ReadData() async {
    final response = await http.get(Uri.parse(Connections.ReadProduct));

    print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = jsonDecode(response.body);
      ProductModel Myproduct = ProductModel.fromJson(data);
      products = Myproduct.data !;
    }
  }

  Future<void> CreateData(String ProductName, String img, int Qty, int UnitPrice, int TotalPrice) async {
    final response = await http.post(
      Uri.parse(Connections.CreateProduct),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "ProductName": ProductName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": img,
        "Qty": Qty,
        "UnitPrice": UnitPrice,
        "TotalPrice": TotalPrice,
      }),
    );

    if (response.statusCode == 200) {
      ReadData();
    }
  }


  Future<void> UpdateData(String id ,String ProductName, String img, int Qty, int UnitPrice, int TotalPrice) async {
    final response = await http.post(
      Uri.parse(Connections.UpdateProduct(id)),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "ProductName": ProductName,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": img,
        "Qty": Qty,
        "UnitPrice": UnitPrice,
        "TotalPrice": TotalPrice,
      }),
    );

    if (response.statusCode == 200) {
      ReadData();
    }
  }

// Delete Data
  Future<bool> DeleteData(String id) async {
    final response = await http.get(Uri.parse(Connections.DeleteProduct(id)));

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }





}










