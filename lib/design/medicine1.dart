import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/design/medicine%20detail.dart';
class Medicine1 extends StatefulWidget {
  const Medicine1({Key? key}) : super(key: key);

  @override
  State<Medicine1> createState() => _Medicine1State();
}

class _Medicine1State extends State<Medicine1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicines"),
        backgroundColor: kPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child:  GestureDetector(
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
        ),
      ),
    );
  }
}
