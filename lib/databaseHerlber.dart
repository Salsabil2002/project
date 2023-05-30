
import 'package:sqflite/sqflite.dart';
import 'package:weather/product.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDatabase() async {
    String appPath = await getDatabasesPath();
    String dbPath = appPath + '/flutter_course.db';
    database = await openDatabase(dbPath, version: 2, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE product (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, price REAL)');
    });
  }

  insertNewProduct(Product product) async {
    // try {
      int rowNumber = await database.insert('product', product.toMap());
      // log(rowNumber.toString());
    // } catch (e) {
    //   // log("row has not been inserted");
    // }
  }

  Future<List<Product>> getAllProudcts() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Map> results = await database.query('product');
    List<Product> pro = results.map((e) => Product.fromMap(e)).toList();
    return pro;
  }

  Future<Product> getProductById(int id) async {
    List<Map> results = await database.query('product', where: 'id=$id');
    return Product.fromMap(results.first);
  }

  deleteProduct(int id) async {
    await database.delete('product', where: 'id=$id');
  }

  updateProduct(Product product) async {
    await database.update('product', product.toMap(),
        where: 'id=${product.id}');
  }
}