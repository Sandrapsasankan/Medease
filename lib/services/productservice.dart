import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medico/config/constants.dart';
import 'package:medico/design/medishop/medicine.dart';
import 'package:medico/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

File? imageFile;

late  final _filename;
late  final bytes;

class ViewProductApi {

  static Future<List<ViewProductModel>> getProduct() async {
    final urls = APIConstants.url + APIConstants.product;
    print(urls);
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print("items ${body}");
      List<ViewProductModel> _data = List<ViewProductModel>.from(
          body['data'].map((e) => ViewProductModel.fromJson(e)).toList());
      return _data;
    } else {
      throw Exception('Failed to load medicine details');
    }
  }
}

class AddProductApi {
  static Future<ViewProductModel> addProduct(BuildContext context,
      String name,String description,String amount,
      String expire,String manufacture,String category) async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    int medishop_id = (localstorage.getInt('user_id') ?? 0 ) ;
    try {
      var data={
        "medishop":medishop_id.toString(),
        "name":name,
        "description":description,
        "amount":amount,
        "expire":expire,
        "manufacture":manufacture,
        "category":category
      };
     // print(data);
      final urls = APIConstants.url + APIConstants.addproduct;
      print(urls);
      var request = await http.MultipartRequest('POST', Uri.parse(urls));
      request.fields["medishop"]=medishop_id.toString();
      request.fields["name"]=name;
      request.fields["description"]=description;
      request.fields["amount"]=amount;
      request.fields["expire"]=expire;
      request.fields["manufacture"]=manufacture;
      request.fields["category"]=category;
      print("request $request.fields");
      final imageStream = http.ByteStream(imageFile!.openRead());
      final imageLength = await imageFile!.length();

      final multipartFile = await http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: _filename,
      );
      request.files.add(multipartFile);
      print("filename $_filename");

      final response = await request.send();

      if (response.statusCode == 201) {
        print('Form submitted successfully');
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Medihome()));
        return ViewProductModel.fromJson(
            jsonDecode(await response.stream.bytesToString()));
      } else {
        print('Error submitting form. Status code: ${response.statusCode}');
        // Handle the error and return an appropriate value or throw an error
        throw Exception('Failed to add product');
      }
    } catch (error) {
      // Handle any errors here
      print('Error: $error');
      throw error; // You can choose to throw or return an error response
    }
  }
}