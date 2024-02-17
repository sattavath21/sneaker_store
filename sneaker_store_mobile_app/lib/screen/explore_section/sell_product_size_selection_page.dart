import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/buy_product_button.dart';
import 'package:sneaker_store_mobile_app/component/selected_product_header.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/product_with_size.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/billing_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/product_condition_selection_page.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/sell_product_detail_page.dart.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';
import 'dart:convert';

// *TODO Business process is wrong here


class SellProductSizeSelectionPage extends StatelessWidget {
  final Product product;

  const SellProductSizeSelectionPage({super.key, required this.product});

Route _createRoute(Widget destinationPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Adjusted to come from the right
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 centerTitle: true,
        title: Text("Sell", style: app_text_style.latoStyle(fontSize: 18),),      ),
      body: Container(
        color: Color.fromARGB(255, 246, 246, 246),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product details
            SelectedProductHeader(product: product),
            // Size details and Size Chart
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select size',
                          style: app_text_style.latoStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // Available prices
                    SizedBox(height: 16.0),


                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.69,
                      child: GridView.builder(
                        //section to define column number, x andy spacing
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5.0, //x spacing
                          mainAxisSpacing: 5.0, //y spacing
                        ),
                        itemCount: 34,
                        itemBuilder: (context, index) {
                          double shoeSize = 35.5 + (index * 0.5);
                          bool hasSize = product.productWithSizes.any(
                              (productWithSize) =>
                                  productWithSize.shoeSize.sizeNumber ==
                                  shoeSize);

                          return GestureDetector(
                            onTap: () {
                              
                              //move to new creen
                              Navigator.of(context)
                              .push(_createRoute(SellProductDetailPage(selectedShoeSize: shoeSize, product: product)));
                              
                            },
                            child: Card(
                              surfaceTintColor: Colors.white,
                              elevation: 1,
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: app_text_style.latoStyle(height: 0.7),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${shoeSize.toString()}\n\n"),
                                      TextSpan(
                                        text: hasSize
                                            ? "\u0E3F${product.retailPrice}"
                                            : "Order",
                                        style: app_text_style.latoStyle(
                                            color: hasSize
                                                ? Colors.orange
                                                : Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

