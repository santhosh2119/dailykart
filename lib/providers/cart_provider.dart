import 'dart:async';
import 'dart:convert';

import 'package:daily_kart/models/formData.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../base/apis.dart';

class CartProvider with ChangeNotifier {
  final List<dynamic> _cartItems = [];
  // final List cartItems = [];
  List<dynamic> get cartItems => _cartItems;

  Future<bool?> addToCart(int userid, String productId, String productCategory,
      String productPrice, String mrp, String productQty) async {
    print(productPrice.runtimeType);
    print(mrp.runtimeType);
    print(productId.runtimeType);
    print(productCategory.runtimeType);
    print(userid.runtimeType);
    print(productQty.runtimeType);
    var data = {
      // "productId": "2",
      // "productCategory": "27",
      // "productPrice": "500",
      // "mrp": "650",
      // "productQty": "1kG"

      "productId": productId,
      "prodcutCategory": productCategory,
      "productPrice": productPrice,
      "mrp": productPrice,
      "productQty": productQty,
    };

    final url = Uri.parse((Api.addToCart));

    try {
      print(data);
      print("workinggggggggggggggggggggggggggggg");
      final response = await http.post(url,
          body: {"userid": userid.toString(), "object": data.toString()});

      print(response.body);

      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
