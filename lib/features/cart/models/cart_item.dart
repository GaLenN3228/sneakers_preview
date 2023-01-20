class CartItem {
  CartItem({
    this.id,
    this.name,
    this.count,
    this.price,
    this.image,
  });

  final int? id;
  final String? name;
  final int? count;
  final String? price;
  final String? image;

  CartItem copyWith({
    int? id,
    String? name,
    int? count,
    String? price,
    String? image,
  }) {
    return CartItem(
      image: image ?? this.image,
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }
}
