import 'package:flutter/material.dart';
import 'package:medico/models/category.dart';
import 'package:medico/services/categoryservice.dart';

class Dropdownss extends StatefulWidget {
  const Dropdownss({Key? key}) : super(key: key);

  @override
  State<Dropdownss> createState() => _DropdownssState();
}

class _DropdownssState extends State<Dropdownss> {

  ViewCategoryApi viewcategories = ViewCategoryApi();
  String? dropDownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ViewCategoryModel>>(
        future: viewcategories.getCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<ViewCategoryModel>> snapshot) {
          if (snapshot.hasData) {
            List<ViewCategoryModel> categories = snapshot.data!;
            return SizedBox(
             height: double.maxFinite,
              width: double.maxFinite,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
                hint: Text('Categories'),
                value: dropDownvalue,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.id.toString(),
                    child: Text(
                      '${category.name} (${category.id})',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (type) {
                  setState(() {
                    dropDownvalue = type;
                  });
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
