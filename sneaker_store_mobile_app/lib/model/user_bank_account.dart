import 'dart:convert';

import 'bank.dart';

class UserBankAccount {
  final Bank bank;
  final String accountName;
  final String accountNumber;
  final String accountQr;
  UserBankAccount({
    required this.bank,
    required this.accountName,
    required this.accountNumber,
    required this.accountQr,
  });

  UserBankAccount copyWith({
    Bank? bank,
    String? accountName,
    String? accountNumber,
    String? accountQr,
  }) {
    return UserBankAccount(
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

  factory UserBankAccount.fromMap(Map<String, dynamic> map) {
    return UserBankAccount(
      bank: Bank.fromMap(map['bank'] as Map<String,dynamic>),
      accountName: map['accountName'] as String,
      accountNumber: map['accountNumber'] as String,
      accountQr: map['accountQr'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserBankAccount.fromJson(String source) => UserBankAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserBankAccount(bank: $bank, accountName: $accountName, accountNumber: $accountNumber, accountQr: $accountQr)';
  }

  @override
  bool operator ==(covariant UserBankAccount other) {
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