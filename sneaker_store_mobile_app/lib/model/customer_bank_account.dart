import 'dart:convert';

import 'bank.dart';

class CustomerBankAccount {
  final Bank bank;
  final String accountName;
  final String accountNumber;
  String? accountQr;
  CustomerBankAccount({
    required this.bank,
    required this.accountName,
    required this.accountNumber,
    this.accountQr,
  });

  CustomerBankAccount copyWith({
    Bank? bank,
    String? accountName,
    String? accountNumber,
    String? accountQr,
  }) {
    return CustomerBankAccount(
      bank: bank ?? this.bank,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountQr: accountQr ?? this.accountQr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bank': bank.toMap(),
      'accountName': accountName,
      'accountNumber': accountNumber,
      'accountQr': accountQr,
    };
  }

  factory CustomerBankAccount.fromMap(Map<String, dynamic> map) {
    return CustomerBankAccount(
      bank: Bank.fromMap(map['bank'] as Map<String,dynamic>),
      accountName: map['accountName'] as String,
      accountNumber: map['accountNumber'] as String,
      accountQr: map['accountQr'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerBankAccount.fromJson(String source) => CustomerBankAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerBankAccount(bank: $bank, accountName: $accountName, accountNumber: $accountNumber, accountQr: $accountQr)';
  }

  @override
  bool operator ==(covariant CustomerBankAccount other) {
    if (identical(this, other)) return true;
  
    return 
      other.bank == bank &&
      other.accountName == accountName &&
      other.accountNumber == accountNumber &&
      other.accountQr == accountQr;
  }

  @override
  int get hashCode {
    return bank.hashCode ^
      accountName.hashCode ^
      accountNumber.hashCode ^
      accountQr.hashCode;
  }
}