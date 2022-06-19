class ProductsModel {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  ProductsModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  Map toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'price': price,
    };

    return map;
  }
}
