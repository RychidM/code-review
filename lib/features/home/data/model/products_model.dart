class ProductModel {
  String? id;
  String productName;
  String productCategory;
  int qty;
  double productPrice;
  String? manDate;
  String? expDate;

  ProductModel({
    required this.productName,
    this.id,
    this.expDate,
    this.manDate,
    required this.productCategory,
    required this.productPrice,
    required this.qty,
  });
}
