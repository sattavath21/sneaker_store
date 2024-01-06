import 'dart:convert';

class Bank {
  final String bank_name;
  Bank({
    required this.bank_name,
  });

  Bank copyWith({
    String? bank_name,
  }) {
    return Bank(
      bank_name: bank_name ?? this.bank_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bank_name': bank_name,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      bank_name: map['bank_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Bank(bank_name: $bank_name)';

  @override
  bool operator ==(covariant Bank other) {
    if (identical(this, other)) return true;
  
    return 
      other.bank_name == bank_name;
  }

  @override
  int get hashCode => bank_name.hashCode;
}