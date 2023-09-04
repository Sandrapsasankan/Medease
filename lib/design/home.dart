import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/design/medicine.dart';
import 'package:medico/design/nearest.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          height: 70,
                          width: 70,
                        ),
                        SizedBox(width: 20), // Use SizedBox to control spacing
                        Text(
                          "Medease",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10, // Adjust the top position as needed
                  right: 10, // Adjust the right position as needed
                  child: IconButton(
                    tooltip: "Logout",
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 28,
                    ),
                  )
                ),
              ],
            ),


            SizedBox(height: 80,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Other content goes here
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Nearest()));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: kPrimary,
                              border: Border.all(
                                color: Colors.white,
                                width: 10.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Nearest',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Medicine()));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: kPrimary,
                              border: Border.all(
                                color: Colors.white,
                                width: 10.0,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Center(
                              child: Text(
                                'Medicine',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 20),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: kPrimary,
                            border: Border.all(
                              color: Colors.white,
                              width: 10.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Orders',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),

                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
