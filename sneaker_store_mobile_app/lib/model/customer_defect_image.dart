import 'dart:convert';

class CustomerDefectImage {
  final String defectImage;
  CustomerDefectImage({
    required this.defectImage,
  });

  CustomerDefectImage copyWith({
    String? defectImage,
  }) {
    return CustomerDefectImage(
      defectImage: defectImage ?? this.defectImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'defectImage': defectImage,
    };
  }

  factory CustomerDefectImage.fromMap(Map<String, dynamic> map) {
    return CustomerDefectImage(
      defectImage: map['defectImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerDefectImage.fromJson(String source) => CustomerDefectImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomerDefectImage(defectImage: $defectImage)';

  @override
  bool operator ==(covariant CustomerDefectImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.defectImage == defectImage;
  }

  @override
  int get hashCode => defectImage.hashCode;
}