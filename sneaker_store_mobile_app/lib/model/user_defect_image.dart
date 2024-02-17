import 'dart:convert';

class UserDefectImage {
  final String defectImage;
  UserDefectImage({
    required this.defectImage,
  });

  UserDefectImage copyWith({
    String? defectImage,
  }) {
    return UserDefectImage(
      defectImage: defectImage ?? this.defectImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'defectImage': defectImage,
    };
  }

  factory UserDefectImage.fromMap(Map<String, dynamic> map) {
    return UserDefectImage(
      defectImage: map['defectImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDefectImage.fromJson(String source) => UserDefectImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDefectImage(defectImage: $defectImage)';

  @override
  bool operator ==(covariant UserDefectImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.defectImage == defectImage;
  }

  @override
  int get hashCode => defectImage.hashCode;
}