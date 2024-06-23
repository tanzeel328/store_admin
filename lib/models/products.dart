class Productz {
  String company;
  int price;
  List<int> size;
  String title;
  String image;
  // bool inStock;

  Productz({
    required this.company,
    required this.price,
    required this.size,
    required this.title,
    required this.image,
    // required this.inStock,
  });

  Map<String, Object?> toJson() {
    return {
      'company': company,
      'price': price,
      'size': size,
      'title': title,
      'imageUrl': image,
      // 'inStock': inStock,
    };
  }

  Productz.fromJson(Map<String, Object?> json)
      : this(
          company: json['company']! as String,
          price: json['price']! as int,
          size: (json['size'] as List).map((item) => item as int).toList(),
          title: json['title']! as String,
          image: json['imageUrl']! as String,
          // inStock: json['inStock']! as bool,
        );

  Productz copyWith({
    String? company,
    int? price,
    List<int>? size,
    String? title,
    String? image,
    // bool? inStock,
  }) {
    return Productz(
      company: company ?? this.company,
      price: price ?? this.price,
      size: size ?? this.size,
      title: title ?? this.title,
      image: image ?? this.image,
      // inStock: inStock ?? this.inStock,
    );
  }
}
