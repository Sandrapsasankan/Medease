// import 'dart:convert';
// import 'package:medico/models/medishop.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:medico/config/constants.dart';
// import 'package:medico/services/apisevice.dart';
//
// class SearchItem{
//
//   static Future<void> searchItems(BuildContext context, String text) async {
//     var data = {
//       "search": text,
//     };
//
//     try {
//       var response = await Api().authData(data,APIConstants.searchlocation);
//       var body = json.decode(response.body);
//       if (body['success'] == true) {
//         List _data=body['data'];
//         var items=_data.map((e) => medishopregister.fromJson(e)).toList();
//        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResult(items:items)));
//
//       }
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(body['message']),
//             ));
//       }
//     }
//     catch (e) {
//       throw e.toString();
//     }
//     throw 'Unexpected error occurred';
//   }
// }