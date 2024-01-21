import 'dart:convert';

class CustomerProductImage {
  final String productImage;
  CustomerProductImage({
    required this.productImage,
  });

  CustomerProductImage copyWith({
    String? productImage,
  }) {
    return CustomerProductImage(
      productImage: productImage ?? this.productImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productImage': productImage,
    };
  }

  factory CustomerProductImage.fromMap(Map<String, dynamic> map) {
    return CustomerProductImage(
      productImage: map['productImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerProductImage.fromJson(String source) => CustomerProductImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomerProductImage(productImage: $productImage)';

  @override
  bool operator ==(covariant CustomerProductImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.productImage == productImage;
  }

  @override
  int get hashCode => productImage.hashCode;
}