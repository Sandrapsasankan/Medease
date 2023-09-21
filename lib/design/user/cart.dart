import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';




class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [];

  double getTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Cart'),
backgroundColor: kPrimary,

      ),
      body:SizedBox(
        height: 160,
        child: Card(
                child: Padding(
                  padding:
                  const EdgeInsets.all(10.0),
                  child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        height: 140,
                        width: 200,
                        child:  Column(
                          children: [
                            Image.asset(
                              'images/logo.png',
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "firstWord", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Rs.300",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),

Container(
  child:  Column(
      children: [
        IconButton(
          icon: Icon(
            Icons.delete,
          ),
          onPressed: () {
            setState(() {
             // _deleteData(cart[index].id);
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                   // _decrement(cart[index].id);
                  });
                },
                backgroundColor: Colors.grey,
                child:
                Icon(Icons.remove, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "qty",
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                   // _increment(cart[index].id);
                  });
                },
                backgroundColor: Colors.grey,
                child: Icon(Icons.add, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    ),
)
                    ],
                  ),
                        ),
        ),
      ),
              );
        }


}
