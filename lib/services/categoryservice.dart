import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medico/config/constants.dart';
import 'package:medico/models/category.dart';
class ViewCategoryApi {

  Future<List<ViewCategoryModel>> getCategories() async {
    final urls = APIConstants.url + APIConstants.category;
    print(urls);
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<ViewCategoryModel> _data = List<ViewCategoryModel>.from(
          body['data'].map((e) => ViewCategoryModel.fromJson(e)).toList());
      return _data;
    }
    else {
      List<ViewCategoryModel> _data = [];
      return _data;
    }
  }
}