import 'package:flutter/material.dart';
import 'package:api_13_test_2nd/Model/ProductModel.dart';
import 'package:api_13_test_2nd/DescriptionPage.dart';

class Descriptionpage  extends StatelessWidget {
  final Data user;

  Descriptionpage(
      {
        required this.user,
        super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${user.productName}'),
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.blueGrey.shade300,
          backgroundColor: Colors.blueGrey.shade300,
        ),

        body: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.deepOrange,
                child: Image(image: NetworkImage(user.img.toString()),fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(user.productName.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    Text("${user.unitPrice.toString()}\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),),
SizedBox(
  height: 350,
),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(onPressed: (){},style: buttonStyle, child: Text('Purchase',)),
    ElevatedButton(onPressed: (){}, style: buttonStyle,child: Text('Add to Cart',)),
  ],
)
                  ],
                ),
              )

            ],
          ),
        ),

      ),
    );
  }
}
