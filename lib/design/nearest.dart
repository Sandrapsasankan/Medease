import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
class Nearest extends StatefulWidget {
  const Nearest({Key? key}) : super(key: key);

  @override
  State<Nearest> createState() => _NearestState();
}

class _NearestState extends State<Nearest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,


      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
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
      ),
    );
  }
}
