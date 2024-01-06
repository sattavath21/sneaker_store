import 'dart:convert';

import 'bank.dart';

class Customer_bank_account {
  final Bank bank;
  final String account_name;
  final String account_number;
  final String account_qr;
  Customer_bank_account({
    required this.bank,
    required this.account_name,
    required this.account_number,
    required this.account_qr,
  });

  Customer_bank_account copyWith({
    Bank? bank,
    String? account_name,
    String? account_number,
    String? account_qr,
  }) {
    return Customer_bank_account(
      bank: bank ?? this.bank,
      account_name: account_name ?? this.account_name,
      account_number: account_number ?? this.account_number,
      account_qr: account_qr ?? this.account_qr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bank': bank.toMap(),
      'account_name': account_name,
      'account_number': account_number,
      'account_qr': account_qr,
    };
  }

  factory Customer_bank_account.fromMap(Map<String, dynamic> map) {
    return Customer_bank_account(
      bank: Bank.fromMap(map['bank'] as Map<String,dynamic>),
      account_name: map['account_name'] as String,
      account_number: map['account_number'] as String,
      account_qr: map['account_qr'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer_bank_account.fromJson(String source) => Customer_bank_account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer_bank_account(bank: $bank, account_name: $account_name, account_number: $account_number, account_qr: $account_qr)';
  }

  @override
  bool operator ==(covariant Customer_bank_account other) {
    if (identical(this, other)) return true;
  
    return 
      other.bank == bank &&
      other.account_name == account_name &&
      other.account_number == account_number &&
      other.account_qr == account_qr;
  }

  @override
  int get hashCode {
    return bank.hashCode ^
      account_name.hashCode ^
      account_number.hashCode ^
      account_qr.hashCode;
  }
}