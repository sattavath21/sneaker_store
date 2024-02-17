import 'dart:convert';

class UserProductImage {
  final String productImage;
  UserProductImage({
    required this.productImage,
  });

  UserProductImage copyWith({
    String? productImage,
  }) {
    return UserProductImage(
      productImage: productImage ?? this.productImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productImage': productImage,
    };
  }

  factory UserProductImage.fromMap(Map<String, dynamic> map) {
    return UserProductImage(
      productImage: map['productImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProductImage.fromJson(String source) => UserProductImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserProductImage(productImage: $productImage)';

  @override
  bool operator ==(covariant UserProductImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.productImage == productImage;
  }

  @override
  int get hashCode => productImage.hashCode;
}