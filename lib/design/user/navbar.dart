import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/design/user/cart.dart';
import 'package:medico/design/user/home.dart';
import 'package:medico/design/user/profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final items = const [
    // Icon(Icons.people, size: 30,),

    Icon(Icons.person, size: 30,color: Colors.white,),
    Icon(Icons.home, size: 30,color: Colors.white,),
    Icon(Icons.shopping_cart, size: 30,color: Colors.white,)
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
       color: kPrimary,
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(

          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }
  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const Profile();
        break;
      case 1:
        widget = const Home();
        break;
      default:
        widget = CartPage();
        break;
    }
    return widget;
  }
}
