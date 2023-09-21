import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medico/config/constants.dart';
import 'package:medico/models/medishop.dart';
class ViewMedishopApi {

  Future<List<medishopregister>> getmedishop() async {
    final urls = APIConstants.url + APIConstants.medishopview;
    print(urls);
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<medishopregister> _data = List<medishopregister>.from(
          body['data'].map((e) => medishopregister.fromJson(e)).toList());
      return _data;
    }
    else {
      List<medishopregister> _data = [];
      return _data;
    }
  }
}