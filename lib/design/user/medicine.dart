import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/config/constants.dart';
import 'package:medico/design/user/medicine%20detail.dart';
import 'package:medico/models/category.dart';
import 'package:medico/models/product.dart';
import 'package:medico/services/categoryservice.dart';
import 'package:medico/services/productservice.dart';
class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  ViewCategoryApi viewcategory=ViewCategoryApi();
  ViewProductApi viewproduct=ViewProductApi();
  int ? checkindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,


      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Hi! John',
                style: TextStyle(
                  color: kTextPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),


              SizedBox(height: 40),
              ClipRRect(
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

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: kTextPrimary,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 15),
              Container(
                  height: 150,
                  child: FutureBuilder<List<ViewCategoryModel>>(
                    future: viewcategory.getCategories(),
                    builder: (BuildContext content,AsyncSnapshot<List<ViewCategoryModel>> snapshot){
                      if(snapshot.hasData){

                        return ListView.builder(

                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context,index){
                              print(APIConstants.url+snapshot.data![index].image.toString());
                              return GestureDetector(
                                onTap: () {

                                  checkindex = index;
                                   setState(() {

checkindex=index;
                                  });
                                },
                                child: Container(

                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: 100,

                                          padding: const EdgeInsets.all(10),
                                           margin: const EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                              color: checkindex == index ? Colors.teal.shade800 : Colors.white,

                                              borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(APIConstants.url+snapshot.data![index].image.toString(),),fit: BoxFit.cover
                                            ),

                                          ),),
                                      ),

                                      const SizedBox(height: 10,),
                                      Text(snapshot.data![index].name.toString(),textAlign: TextAlign.center,style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white
                                      ),)
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }
                      return const Center(child: CircularProgressIndicator(),);
                    },
                  )
              ),

              SizedBox(height: 15),
         Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width,

            child: FutureBuilder<List<ViewProductModel>>(
              future: ViewProductApi.getProduct(),
              builder: (BuildContext content,AsyncSnapshot<List<ViewProductModel>> snapshot){
                if(snapshot.hasData){

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      print(APIConstants.url + snapshot.data![index].image.toString());
                      return GestureDetector(
                        onTap: () {
                          checkindex = index;
                          setState(() {});
                        },

                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: kTextSecondary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF073738),
                                offset: Offset(2, 3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row( // Display the image on the left
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 90,
                                  width: 90, // Set a fixed width for the image container
                                  decoration: BoxDecoration(
                                    color: checkindex == index ? Colors.teal.shade800 : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(APIConstants.url
                                          + snapshot.data![index].image.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      snapshot.data![index].name.toString(),
                                      style: TextStyle(
                                        color: kTextPrimary,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].amount.toString(),
                                          style: TextStyle(
                                            color: kTextPrimary,
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(width: 120,),
                                        Icon(
                                          Icons.shopping_cart,
                                          color: kTextPrimary,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),
                      );
                    },
                  );

                }
                return const Center(child: CircularProgressIndicator(),);
              },
            )


         ),
            ],
          ),
        ),
      ),

    );
  }
}
