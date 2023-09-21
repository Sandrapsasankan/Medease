import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/config/constants.dart';
import 'package:medico/design/user/home.dart';
import 'package:medico/models/userregister.dart';
import 'package:medico/services/apisevice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UpdateProfile{

  Future<UserRegisterModel> updateProfile(BuildContext context, String name, String phone_number, String email) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = (prefs.getInt('login_id') ?? 0 ) ;
    print('Outsider id ${userId}');

    var userData= {
      "nameController": name,
      "phnController": phone_number,
      "emailController":email,
    };

    try{
      var response = await Api().putData(userData, APIConstants.updateProfile+userId.toString());
      var body = json.decode(response.body);
      print(body);
      if(body['success'] == true){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message'],),
            ));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        return UserRegisterModel.fromJson(jsonDecode(response.body));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(body['message']),
            ));
      }
    }
    catch (e) {
      throw e.toString();
    }
    throw 'Unexpected error occurred';
  }
}