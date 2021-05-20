class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;

  Product({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name)';
  }
}
