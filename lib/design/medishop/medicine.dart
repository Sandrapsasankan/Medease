import 'package:flutter/material.dart';
import 'package:medico/config/color.dart';
import 'package:medico/config/constants.dart';
import 'package:medico/design/medishop/addmedicine.dart';
import 'package:medico/models/product.dart';
import 'package:medico/services/productservice.dart';
class Medihome extends StatefulWidget {
  const Medihome({Key? key}) : super(key: key);

  @override
  State<Medihome> createState() => _MedihomeState();
}

class _MedihomeState extends State<Medihome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: kPrimary,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
        title: Text("Medicines"),
        actions:[
          IconButton(icon: Icon(Icons.add), onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => Addmedicine()));
           },)
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
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

    setState(() {});
    },
                      child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(),
                          child: ListTile(
                            leading: CircleAvatar(
radius: 50.0,
                              backgroundColor: kPrimary,
                              backgroundImage:NetworkImage(APIConstants.url
    + snapshot.data![index].image.toString()),


                            ) ,
                            title: Text(
    snapshot.data![index].name.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            trailing:
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kPrimary,
                              ),
                              onPressed: () {
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => Aproductupdate(id:id) ));
                              },
                              child: const Text('Update'),
                            ),
                          )
                      ),
    );
    },
    );

    }
    return const Center(child: CircularProgressIndicator(),);
    },
          )



          ),

      ),

    );
  }
}
