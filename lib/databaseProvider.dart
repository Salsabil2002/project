import 'package:flutter/material.dart';
import 'package:weather/product.dart';
import 'package:weather/screens/AddProuduct.dart';
import 'databaseHerlber.dart';

class DbController extends ChangeNotifier {
  DbController() {
    getAllProduct();
  }
  List<Product> product = [];
  bool isLoading = false;
  flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getAllProduct() async {
    flipIsLoading();
    product = await DbHelper.dbHelper.getAllProudcts();
    flipIsLoading();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool isMale = true;
  insertNewProduct() async {
    Product product = Product(
        name: nameController.text,
        description: detailsController.text,
        price: double.parse(priceController.text));
    await DbHelper.dbHelper.insertNewProduct(product);
    getAllProduct();
  }

  // updateStudent(int id) async {

  // }
int id = 0;
  navigateToEditScreen(Product pro, BuildContext context) {
    nameController.text = pro.name ?? '';
    priceController.text = pro.price.toString();
    detailsController.text = pro.description.toString();

    id = pro.id!;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewProduct(false);
    }));
  }
  updatePro() async {
    Product student = Product(
        id: id,
        name: nameController.text,
       price: double.parse(priceController.text),
      description:detailsController.text ,
       );
    await DbHelper.dbHelper.updateProduct(student);
    getAllProduct();
  }

  deleteProduct(int id) async {
    await DbHelper.dbHelper.deleteProduct(id);
    product.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}