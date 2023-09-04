import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/design/medicine%20detail.dart';
import 'package:medico/design/medicine1.dart';
class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,


      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Hi! John',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),


            SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TextField(
                onChanged: (value) {
                  // Handle search query changes here
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kSecondary,
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: kTextPrimary,
                    fontSize: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                  prefixIcon: Icon(
                   Icons.search,
                    color: kTextPrimary,
                    size: 25,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    color: kTextPrimary,
                    fontSize: 20,
                  ),
                ),

              ],
            ),
            SizedBox(height: 15),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Medicine1()));
            },
            child: Container(
              height: 125,
              width: 125,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: kSecondary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF073738),
                    offset: Offset(2, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ice_skating,
                    color: kTextPrimary,
                    size: 40,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "title",
                    style: TextStyle(
                      color: kTextPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

            SizedBox(height: 15),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDescriptionPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              color: kTextSecondary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF073738),
                  offset: Offset(2, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset("images/logo.png",width: 60,height: 60,),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "name",
                        style: TextStyle(
                          color: kTextPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "price",
                            style: TextStyle(
                              color: kTextPrimary,
                              fontSize: 25,
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: kTextPrimary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),

    );
  }
}
