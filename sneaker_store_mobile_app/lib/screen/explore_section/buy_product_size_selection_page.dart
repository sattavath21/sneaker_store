import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/buy_product_button.dart';
import 'package:sneaker_store_mobile_app/component/selected_product_header.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/product_with_size.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/billing_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/product_condition_selection_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';
import 'dart:convert';

class BuyProductSizeSelectionPage extends StatelessWidget {
  final Product product;

  const BuyProductSizeSelectionPage({super.key, required this.product});

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

  void showNotificationBottomSheet(BuildContext context, double shoeSize) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal()),
      builder: (BuildContext context) {
        return SizedBox(
          // ModalBottomSheet height
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: BuyProductButton(
                        backgroundColor: Colors.green,
                        text: "Ship-ready",
                        onPressed: () {
                          Navigator.of(context)
                              .push(_createRoute(ProductConditionSelectionPage(
                            product: product,
                            selectedSize: shoeSize,
                            productStatusIcon: Icon(
                              Icons.warehouse_rounded, // Use the lightning  icon
                              color:
                                  Colors.green, // Adjust the color of the icon
                              size: 15, // Adjust the size of the icon
                            ),
                            
                          )));
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: BuyProductButton(
                          backgroundColor: Colors.white,
                          text: "Standard",
                          onPressed: () {
                            Navigator.of(context).push(
                                _createRoute(ProductConditionSelectionPage(
                              product: product,
                              selectedSize: shoeSize,
                              productStatusIcon: Icon(
                                Icons.groups_2_rounded,
                                color: Colors.black,
                                size: 15,
                              ),
                            )));
                          }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: BuyProductButton(
                          backgroundColor: Colors.orange,
                          text: "Pre-order",
                          onPressed: () {
                            Navigator.of(context)
                                .push(_createRoute(BillingDetailPage()));
                          }),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  showOrderDialog(bool hasSize, BuildContext context, double shoeSize) {
    if (!hasSize) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
                insetPadding: EdgeInsets.fromLTRB(8, 200, 8, 200),
                surfaceTintColor: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Icon(
                          Icons.sentiment_dissatisfied_rounded,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          height: 50,
                          width: 350,
                          child: Center(
                              child: Text('No sneaker in stock ...',
                                  style:
                                      app_text_style.latoStyle(fontSize: 20)))),
                      SizedBox(
                          width: 300,
                          child: Text(
                            'There are currently no sellers offering items, and there are no products in stock at the moment.',
                            style: app_text_style.latoStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: BuyProductButton(
                            backgroundColor: Colors.orange,
                            text: "Pre-order",
                            onPressed: () {
                              Navigator.of(context)
                                  .push(_createRoute(BillingDetailPage()));
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        
                        child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                          child: ElevatedButton(
                                          onPressed: () {
                          Navigator.pop(context, 'OK');                
                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(Colors.red),
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(Colors.white),
                                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                              EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                              
                                            ),
                                            fixedSize:
                                                MaterialStateProperty.all<Size>(Size.fromHeight(50.0)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.favorite_border_rounded, // Replace with the desired icon
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 8), // Adjust spacing as needed
                                              Text(
                                                'Add sneaker to my wishlist',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                        )

                        ,
                      ),
                    ]),
              ));
    }
    print("Shoe size is $shoeSize");

    return showNotificationBottomSheet(context, shoeSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Buy", style: app_text_style.latoStyle(fontSize: 18),),
      ),
      body: Container(
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 246, 246),
        ),
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
                    Text(
                      'Select Size',
                      style: app_text_style.latoStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
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
                              showOrderDialog(hasSize, context, shoeSize);
                            },
                            child: Card(
                              surfaceTintColor: Colors.white,
                              elevation: 1,
                              // ... other properties
                              child: Stack(
                                children: [
                                  Center(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: app_text_style.latoStyle(
                                            height: 0.7),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  "${shoeSize.toString()}\n\n"),
                                          TextSpan(
                                            text: hasSize
                                                ? "\u0E3F${product.retailPrice}"
                                                : "Order",
                                            style: app_text_style.latoStyle(
                                                color: hasSize
                                                    ? Colors.green
                                                    : Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Visibility(
                                      visible: hasSize,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromARGB(255, 244, 244, 244), // Circle background color
                                          radius:
                                              6, // Adjust the radius to control the size of the circle
                                          child: Icon(
                                            Icons
                                                .warehouse_rounded, // Use the lightning  icon
                                            color: Colors
                                                .green, // Adjust the color of the icon
                                            size: 8, // Adjust the size of the icon
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
