class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });
  // factory Product.adam(bool x) {
  //   if (x) {
  //     return Product(gpa: 99.4, description: name: "adam", id: 1);
  //   } else {
  //     return Product.fromMap({});
  //   }
  // }
  Product.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    price = map['price'];
  }
  toMap() {
    return {"name": name, "description": description, "price": price};
  }
}