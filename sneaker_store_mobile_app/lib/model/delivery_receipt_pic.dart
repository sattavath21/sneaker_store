import 'dart:convert';

class DeliveryReceiptPic {
  final String picString;
  DeliveryReceiptPic({
    required this.picString,
  });

  DeliveryReceiptPic copyWith({
    String? picString,
  }) {
    return DeliveryReceiptPic(
      picString: picString ?? this.picString,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'picString': picString,
    };
  }

  factory DeliveryReceiptPic.fromMap(Map<String, dynamic> map) {
    return DeliveryReceiptPic(
      picString: map['picString'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryReceiptPic.fromJson(String source) => DeliveryReceiptPic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeliveryReceiptPic(picString: $picString)';

  @override
  bool operator ==(covariant DeliveryReceiptPic other) {
    if (identical(this, other)) return true;
  
    return 
      other.picString == picString;
  }

  @override
  int get hashCode => picString.hashCode;
}