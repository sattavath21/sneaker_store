import 'dart:convert';

class Bank {
  final String bankName;
  Bank({
    required this.bankName,
  });

  Bank copyWith({
    String? bankName,
  }) {
    return Bank(
      bankName: bankName ?? this.bankName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankName': bankName,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      bankName: map['bankName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Bank(bankName: $bankName)';

  @override
  bool operator ==(covariant Bank other) {
    if (identical(this, other)) return true;
  
    return 
      other.bankName == bankName;
  }

  @override
  int get hashCode => bankName.hashCode;
}