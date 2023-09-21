import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medico/config/constants.dart';


class Medicalshop {
  final String name;
  final String place;
  final String address;

  Medicalshop(this.name, this.place, this.address);
}

class Nearest extends StatefulWidget {
  @override
  _NearestState createState() => _NearestState();
}

class _NearestState extends State<Nearest> {
  List<Medicalshop> medishop = [];
  List<Medicalshop> filteredmedishop = [];

  @override
  void initState() {
    super.initState();
    fetchmedishopData(); // Fetch hotel data when the app starts
  }

  Future<void> fetchmedishopData() async {
    final Uri apiUrl = Uri.parse(APIConstants.url+APIConstants.medishopview);

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String,dynamic> data = json.decode(response.body);
final List<dynamic> medishoplist = data['data'];
print(medishoplist);
      setState(() {
        medishop = medishoplist.map((medishopData) {
          return Medicalshop(
            medishopData['name'],
            medishopData['place'],
            medishopData['address'],

          );
        }).toList();
        filteredmedishop = medishop; // Initialize filteredHotels with all hotels
      });
    } else {
      throw Exception('Failed to load medicalshop data');
    }
  }

  void searchHotels(String query) {
    setState(() {
      filteredmedishop = medishop
          .where((medishop) =>
          medishop.place.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hotel Search'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 27,horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.search),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.6,
                  child: TextFormField(
                  onChanged: (query) {
                    searchHotels(query);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search for hotels...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              ],
            ),),
            Expanded(
              child: ListView.builder(
                itemCount: filteredmedishop.length,
                itemBuilder: (context, index){
                  final hotel = filteredmedishop[index];
                  return ListTile(
                    title: Text(hotel.name),
                    subtitle: Text(hotel.place),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:medico/config/color.dart';
// import 'package:medico/config/constants.dart';
// import 'package:medico/models/medishop.dart';
// import 'package:medico/services/medishop.dart';
// import 'package:medico/services/search.dart';
// class Nearest extends StatefulWidget {
//   const Nearest({Key? key}) : super(key: key);
//
//   @override
//   State<Nearest> createState() => _NearestState();
// }
//
// class _NearestState extends State<Nearest> {
//   ViewMedishopApi viewmedishop=ViewMedishopApi();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimary,
//       appBar: AppBar(
//         backgroundColor: kPrimary,
//         elevation: 0,
//
//
//       ),
//       body:  Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
//             margin: const EdgeInsets.symmetric(vertical: 27,horizontal: 20),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20)
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Icon(Icons.search),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*.6,
//                   child: TextFormField(
//                     onChanged: (String text){
//                       setState(() {
//
//                         SearchItem.searchItems(context, text);
//                         setState(() {
//                           var isLoaded=false;
//                         });
//                       });
//                     },
//                     decoration: const InputDecoration(
//                         hintText: 'Search the Medicalshop',
//                         border: InputBorder.none
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: (){},
//                     icon: const Icon(Icons.sort)
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 30,),
//           Container(
//
//               padding: EdgeInsets.symmetric(vertical: 10),
//               margin: EdgeInsets.only(bottom: 15),
//               width: MediaQuery.of(context).size.width,
//
//               child: FutureBuilder<List<medishopregister>>(
//                 future: viewmedishop.getmedishop(),
//                 builder: (BuildContext content,AsyncSnapshot<List<medishopregister>> snapshot){
//                   if(snapshot.hasData){
//
//                     return ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: snapshot.data?.length,
//                       itemBuilder: (context, index) {
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//
//                             });
//                           },
//
//                           child: Container(
//                             height: 130,
//                             decoration: BoxDecoration(
//                               color: kTextSecondary,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0xFF073738),
//                                   offset: Offset(2, 3),
//                                   blurRadius: 10,
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 10),
//                                 Text(
//                                   snapshot.data![index].name.toString(),
//                                   style: TextStyle(
//                                     color: kTextPrimary,
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 15),
//                                 Text(
//                                   snapshot.data![index].address.toString(),
//                                   style: TextStyle(
//                                     color: kTextPrimary,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 SizedBox(height: 15),
//                                 Text(
//                                   snapshot.data![index].place.toString(),
//                                   style: TextStyle(
//                                     color: kTextPrimary,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                           ),
//                         );
//                       },
//                     );
//
//                   }
//                   return const Center(child: CircularProgressIndicator(),);
//                 },
//               )
//
//
//           ),
//         ],
//       ),
//     );
//   }
// }
