import 'package:flutter/material.dart';
import 'API_Connection/Connection_Functions.dart';
import 'Widgets/Data_Cart_Widgets.dart';
import 'Widgets/MyTextField.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  ConnectionFunction connectionFunction = ConnectionFunction();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('API Connection'), // Use the `text` parameter here
          foregroundColor: Colors.white,
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
        ), // Correct usage
        body: Container(
          color: Colors.blueGrey.shade200,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: connectionFunction.products.length,
            itemBuilder: (context, index) {
              var user = connectionFunction.products[index];
              return DataCard(
                onEdit: () => AlertBox(
                  user.sId,
                  user.productName,
                  user.img,
                  user.qty.toString(),
                  user.unitPrice,
                  user.totalPrice,
                ),
                OnDelete: () => connectionFunction.DeleteData(user.sId.toString()),
                user: user,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            AlertBox(null, null, null, '0', 0, 0);
          },
          child: Text("Add"),
        ),
      ),
    );
  }

  // AlertBox
  AlertBox(String? id, String? Name, String? img, String? qty, int? unitprice, int? total) {
    TextEditingController ProductName = TextEditingController();
    TextEditingController Img = TextEditingController();
    TextEditingController Qty = TextEditingController();
    TextEditingController UnitPrice = TextEditingController();
    TextEditingController TotalPrice = TextEditingController();

    ProductName.text = Name ?? '';
    Img.text = img ?? '';
    Qty.text = qty ?? '';
    UnitPrice.text = unitprice.toString();
    TotalPrice.text = total.toString();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(id == null ? 'Adding Product' : 'Update Product'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTextField(
                Mytext: 'Product Name',
                allcontroller: ProductName,
              ),
              MyTextField(
                Mytext: 'Product Image',
                allcontroller: Img,
              ),
              MyTextField(
                Mytext: 'Product Qty',
                allcontroller: Qty,
              ),
              MyTextField(
                Mytext: 'Product Price',
                allcontroller: UnitPrice,
              ),
              MyTextField(
                Mytext: 'Total Price',
                allcontroller: TotalPrice,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (id == null) {
                          connectionFunction.CreateData(
                            ProductName.text,
                            Img.text,
                            int.parse(Qty.text),
                            int.parse(UnitPrice.text),
                            int.parse(TotalPrice.text),
                          );
                        } else {
                          connectionFunction.UpdateData(
                            id,
                            ProductName.text,
                            Img.text,
                            int.parse(Qty.text),
                            int.parse(UnitPrice.text),
                            int.parse(TotalPrice.text),
                          );
                        }
                        ReadData();
                        Navigator.pop(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(id == null ? 'Add' : 'Update'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Data Read Method
  Future<void> ReadData() async {
    await connectionFunction.ReadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }
}
