
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../databaseProvider.dart';

class NewProduct extends StatelessWidget {
  bool isNewProduct;
  NewProduct([this.isNewProduct = true]);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DbController>(builder: (context, pr, x) {
      return Scaffold(
        appBar: AppBar(
            title:
            Text(isNewProduct ? "New Prouduct Screen" : "Update Student")),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            // key: pr.f,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required field";
                    } else if (value.length < 3) {
                      return "the name must be larger than or equal 3 letters";
                    }
                  },
                  controller: pr.nameController,
                  decoration: InputDecoration(

                      labelText: "Enter the product name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required field";
                    }else if (double.parse(value) > 100 ||
                        double.parse(value) < 0) {
                      return "";
                    }
                  },
                  // keyboardType: TextInputType.number,
                  controller: pr.detailsController,
                  decoration: InputDecoration(
                      labelText: "Enter the details",
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(15))
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required field";
                    }else if (double.parse(value) > 100 ||
                        double.parse(value) < 0) {
                      return "";
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: pr.priceController,
                  decoration: InputDecoration(
                      labelText: "Enter the Student price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),

                SizedBox(
                  height: 20,
                ),
                    ElevatedButton(
                    onPressed: () async {
                      if (isNewProduct) {
                        pr.insertNewProduct();
                      } else {
                        // pr.update();
                      }
                    },
                    child: Text(isNewProduct
                        ? "Insert New Product"
                        : "Update Product")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop("hello");
                    },
                    child: Text("back to previous page")),
              ],
            ),
          ),
        ),
      );
    });
  }
}