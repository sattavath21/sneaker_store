//===> class: ProductConditionSelectionPage
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/component/selected_product_header.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/billing_detail_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class ProductConditionSelectionPage extends StatelessWidget {
  final Product product;
  final Icon productStatusIcon;
  ProductConditionSelectionPage(
      {required this.product, required this.productStatusIcon});

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
          title: Text("ProductConditionSelectionPage"),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SelectedProductHeader(product: product),
                    Positioned(
                      top: MediaQuery.sizeOf(context).height * 0.01,
                      left: MediaQuery.sizeOf(context).width * 0.01,
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.black12, // Circle background color
                        radius:
                            10, // Adjust the radius to control the size of the circle
                        child: productStatusIcon,
                      ),
                    ),
                  ],
                )),
            Divider(
              color: Colors.black54,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    surfaceTintColor: Colors.white60,
                    elevation: 2,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: GestureDetector(
                          onTap: () {
    Navigator.of(context).push(_createRoute(BillingDetailPage()));

                          },
                          child: ListTile(
                            leading: Image.network(
                                product.productImages[0].productImageUrl),
                            titleAlignment: ListTileTitleAlignment.top,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pre-owned",
                                  style: app_text_style.latoStyle(
                                      color: Colors.red),
                                ),
                                Text("Box (no defect)",
                                    style: app_text_style.latoStyle(
                                        color: Colors.green)),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),
                                Text("Standard (3-5 Days)",
                                    style: app_text_style.latoStyle(
                                        color: Colors.black54))
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the children vertically
                              children: [
                                Text(
                                  "The price",
                                  style: app_text_style.latoStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                },
              ),
            )
          ],
        ));
  } //ef
}//ec