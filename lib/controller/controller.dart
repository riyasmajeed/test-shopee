import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shoppee_app/model/apimodel.dart';

class ProductProvider with ChangeNotifier {
  List<Shoee> _shoeeList = [];
  bool _isLoading = false;

  List<Shoee> get shoeeList => _shoeeList;
  bool get isLoading => _isLoading;

  get length => null;

  get productList => null;

  Future<void> fetchShoeeList() async {
    _isLoading = true;
    notifyListeners();
    const apiUrl = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print(response.statusCode);
        final List<dynamic> data = jsonDecode(response.body);
        _shoeeList = data.map((json) => Shoee.fromJson(json)).toList();

      } else {
        throw Exception('Failed to load shoee list');
      }
    } catch (e) {
      throw Exception('Error fetching shoee list: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
