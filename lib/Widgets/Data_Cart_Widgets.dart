import 'package:api_13_test_2nd/DescriptionPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/ProductModel.dart';

class DataCard extends StatelessWidget {
  final Data user;
  final VoidCallback onEdit;
  final VoidCallback OnDelete;

  DataCard(
      {required this.onEdit,
        required this.OnDelete,
        required this.user,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              child: Image(
                image: NetworkImage(user.img ?? 'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg'),
                errorBuilder: (context, error, stackTrace) {
                  return Stack(children:[
                    Image.network("https://i.sstatic.net/y9DpT.jpg",fit: BoxFit.cover,),
                  Center(child: Text("No Image Loaded",style: TextStyle(fontSize: 20),))
                  ]);// Fallback to an asset image
                },
              ),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Descriptionpage(user: user,)));

                    },
                    child: Text(
                      user.productName.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                Text('Price:${user.unitPrice}\$ || QTY: ${user.qty}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => onEdit(),// Wait for the edit operation to complete

                  icon: Icon(Icons.edit),
                ),
                IconButton(
                    onPressed: ()=>OnDelete( ),


                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}