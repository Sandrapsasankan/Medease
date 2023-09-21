import 'package:flutter/material.dart';

class ProductDescriptionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              width: 100, // Adjust image width
              height: 100, // Adjust image height
            ),
            SizedBox(height: 16.0),
            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 28.0, // Increase font size
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Change text color
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "\$99.99", // Change the price
              style: TextStyle(
                fontSize: 24.0, // Increase font size
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.", // Change the description
              style: TextStyle(
                fontSize: 18.0, // Increase font size
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Expiration Date: 2023-12-31", // Change the expiration date
              style: TextStyle(
                fontSize: 18.0, // Increase font size
              ),
            ),
          ],
        ),
      )

    );
  }
}
