import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medico/config/constants.dart';
import 'package:medico/models/userregister.dart';



class ViewProfileAPI{

  Future<UserRegisterModel> getViewProfile(int userId) async {
    final urls = APIConstants.url + APIConstants.viewProfile + userId.toString();
    print(urls);
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print("User Details ${body}");
      return UserRegisterModel.fromJson(body['data']);
    }
    else {
      throw Exception('Failed to load user details');
    }
  }
}