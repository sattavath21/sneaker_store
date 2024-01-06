import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextBahtCurrency extends StatelessWidget {

  Color? textColor = Colors.green;
  final int? price;

  TextBahtCurrency({
    super.key,
    required this.price,
    this.textColor,
  });


  @override
  Widget build(BuildContext context) {
    return Text(
        "${NumberFormat("#,###").format(price)} \u0E3F",
        style: TextStyle(color: textColor),
      );
  }
}