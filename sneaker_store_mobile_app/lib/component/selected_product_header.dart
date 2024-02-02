import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class SelectedProductHeader extends StatelessWidget {
  const SelectedProductHeader({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading:
            Image.network(product.productImages[0].productImageUrl),
        title: Text(
          product.name,
          style: app_text_style.latoStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
              style: app_text_style.latoStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black54,
                height: 2
              ),
              children: <TextSpan>[
                TextSpan(text: 'SKU: '),
                TextSpan(text: product.SKU),
              ]),
        ),
      ),
    );
  }
}
