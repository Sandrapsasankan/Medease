


import 'package:flutter/material.dart';
import 'package:medico/design/medishop/Mregister.dart';
import 'package:medico/design/user/register.dart';
import 'package:medico/login.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        // Background image
      //   Image.asset(
      //   'images/register.png', // Replace with your background image asset path
      //   width: double.infinity,
      //   height: double.infinity,
      //   fit: BoxFit.cover,
      // ),
      DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            const Text(
              "Create Account",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 41,
                color: Colors.black,
              ),
            ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900
                ),
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.transparent, // Remove the underline color
                      width: 2.0, // Set the indicator thickness
                    ),
                  ),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade600,
                padding: const EdgeInsets.only(top: 15,bottom: 28),
                tabs: [
                  Tab(text: "User",),
                  Tab(text: "Pharmacy",),

                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    register(),
                    Mregister(),
                  ],
                ),
              ),
            ],
          ),
        ),
    ])
    );
  }
}
