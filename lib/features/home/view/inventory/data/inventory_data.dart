
final List<CategoryModel> categoryList = [
  CategoryModel(name: 'Non Alcoholic Drinks', description: 'NON'),
  CategoryModel(name: 'Alcoholic Drinks', description: 'ALC'),
  CategoryModel(name: 'Soap', description: 'SP'),
  CategoryModel(name: 'Biscuit', description: 'BIS'),
  CategoryModel(name: 'Cereal', description: 'CER'),
  CategoryModel(name: 'Food', description: 'FD'),
];

class CategoryModel {
  final String? name;
  final String? description;

  CategoryModel({this.name, this.description});
}
