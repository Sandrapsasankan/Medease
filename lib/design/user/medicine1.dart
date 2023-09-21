import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/design/user/medicine%20detail.dart';
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDescriptionPage(),
              ),
            );
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    "images/logo.png",
                    width: 80,
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style: TextStyle(
                          color: Colors.blue, // Change text color
                          fontSize: 20, // Change font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // Adjust vertical spacing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$99.99", // Change the price
                            style: TextStyle(
                              color: Colors.green, // Change text color
                              fontSize: 24, // Change font size
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle cart button click
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.red, // Change icon color
                              size: 30, // Change icon size
                            ),
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
      )

    );
  }
}
