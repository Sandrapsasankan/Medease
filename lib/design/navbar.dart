import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/design/home.dart';
import 'package:medico/design/profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final items = const [
    // Icon(Icons.people, size: 30,),
    Icon(Icons.home, size: 30,),
    Icon(Icons.person, size: 30,),
    Icon(Icons.search_outlined, size: 30,)
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
          // color: Colors.blue,
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
        widget = const Home();
        break;
      // case 1:
      //   widget = const Home();
      //   break;
      default:
        widget = const Profile();
        break;
    }
    return widget;
  }
}
