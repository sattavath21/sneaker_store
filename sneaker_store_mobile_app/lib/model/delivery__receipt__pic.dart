import 'dart:convert';

class Delivery_receipt_pic {
  final String pic_string;
  Delivery_receipt_pic({
    required this.pic_string,
  });

  Delivery_receipt_pic copyWith({
    String? pic_string,
  }) {
    return Delivery_receipt_pic(
      pic_string: pic_string ?? this.pic_string,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pic_string': pic_string,
    };
  }

  factory Delivery_receipt_pic.fromMap(Map<String, dynamic> map) {
    return Delivery_receipt_pic(
      pic_string: map['pic_string'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Delivery_receipt_pic.fromJson(String source) => Delivery_receipt_pic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Delivery_receipt_pic(pic_string: $pic_string)';

  @override
  bool operator ==(covariant Delivery_receipt_pic other) {
    if (identical(this, other)) return true;
  
    return 
      other.pic_string == pic_string;
  }

  @override
  int get hashCode => pic_string.hashCode;
}