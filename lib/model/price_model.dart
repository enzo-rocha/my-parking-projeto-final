class Price {
  int? id;
  double? price;

  Price({
    this.id,
    this.price
  });

  factory Price.fromMap(Map<String, dynamic> json) => Price(
    id: json['id'],
    price: json['price']
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price
    };
  }

  @override
  String toString() {
    return 'Register(id: $id, price: $price)';
  }
}
