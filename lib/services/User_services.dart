import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:sagar_sandwichss/models/allproduct.dart';


class ApiService {
  String endpoint = 'https://rbarnsoft.com/sagaradmin/api/allproduct';

  Future<List<Product>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return (responseData['product'] as List)
          .map((e) => Product.fromJson(e))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());
