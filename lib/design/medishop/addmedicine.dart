import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/models/category.dart';
import 'package:medico/services/categoryservice.dart';
import 'package:medico/services/productservice.dart';
import 'package:path/path.dart';
class Addmedicine extends StatefulWidget {
  const Addmedicine({Key? key}) : super(key: key);

  @override
  State<Addmedicine> createState() => _AddmedicineState();
}

class _AddmedicineState extends State<Addmedicine> {
  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController expireController=TextEditingController();
  TextEditingController manufactureController=TextEditingController();


  ViewCategoryApi viewcategories = ViewCategoryApi();
  String? dropDownvalue;
  File? imageFile;

  late  final _filename;
  late  final bytes;

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Choose from"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.pop(context);
                      //  _openGallery(context);
                    },
                  ),
                  SizedBox(height: 10),
                  const Padding(padding: EdgeInsets.all(0.0)),
                  GestureDetector(
                    child: const Text("Camera"),
                    onTap: () {
                      _getFromCamera();

                      Navigator.pop(context);
                      //   _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(()  {

        imageFile = File(pickedFile.path);
        _filename = basename(imageFile!.path);
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);
        print("imageFile:${imageFile}");
        print(_filename);
        print(_nameWithoutExtension);
        print(_extenion);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        //  _filename = basename(imageFile!.path).toString();
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: kPrimary,
        leading:
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,)),
        title: Text('Add medicine'),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: priceController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  hintText: 'Price',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: descriptionController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Description',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
               controller: expireController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Expire Date',
                  hintText:  'Expire Date',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: manufactureController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Manufactured Date',
                  hintText: 'Manufactured Date',
                ),
              ),
            ),
           SizedBox(height: 20,),
           FutureBuilder<List<ViewCategoryModel>>(
              future: viewcategories.getCategories(),
              builder: (BuildContext context, AsyncSnapshot<List<ViewCategoryModel>> snapshot) {
                if (snapshot.hasData) {
                  List<ViewCategoryModel> categories = snapshot.data!;
                  return SizedBox(
                    width: 350,
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
                            '${category.name} ',
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (type) {
                        setState(() {

                          dropDownvalue = type;
                          print("dropdownvalue $dropDownvalue");
                        });
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(height: 60,),
            Container(

              child: imageFile == null
                  ? Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimary,
                      ),
                      onPressed: () {
                        //    _getFromGallery();
                        _showChoiceDialog(context);
                      },
                      child: Text("Upload Image"),
                    ),
                    Container(
                      height: 40.0,
                    ),

                  ],
                ),
              ): Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.file(
                      imageFile!,
                      width: 100,
                      height: 100,
                      //  fit: BoxFit.cover,
                    ),
                  ), ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimary,
                    ),
                    onPressed: () {
                      //    _getFromGallery();
                      _showChoiceDialog(context);
                    },
                    child: Text("Upload Image"),
                  ),
                ],
              ),
            ),
   SizedBox(height: 40,),
            SizedBox(
              height: 60,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimary,
                ),
                child: const Text('Submit',style: TextStyle(fontSize: 25),),
                onPressed: () {
                  AddProductApi.addProduct(context ,nameController.text,descriptionController.text,priceController.text,expireController.text,
                      manufactureController.text,dropDownvalue.toString());
                  print("product $nameController.text");
                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}
