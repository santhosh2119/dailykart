import 'dart:convert';

import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/models/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Location with ChangeNotifier {
  Future fetchAndSetProducts() async {
    final url = Uri.parse(Api.location);
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<LocationModel> loadedproducts = [];

      for (int i = 0; i < extractedData['locations'].length; i++) {
        loadedproducts
            .add(LocationModel.fromJson(extractedData['locations'][i]));
      }
      notifyListeners();

      return [true, loadedproducts];
    } catch (error) {
      rethrow;
    }
  }
}
