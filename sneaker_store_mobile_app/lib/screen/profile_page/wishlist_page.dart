//===> class: WishlistPage
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/text_currency_format.dart';
import 'package:sneaker_store_mobile_app/model/customer__wishlist.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              "Wishlist",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: WishlistPageContent(),
    );
  } //ef
} //ec

class WishlistPageContent extends StatelessWidget {
  const WishlistPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);
    // Container for background color of the body content
    return Container(
        color: Colors.black12,
        // For Scrolling vertically in body
        child: SingleChildScrollView(
            child: Column(children: [
          // For space for the body
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Wrap(
                children: List.generate(
                    store1.customer.customer_wishlists!.length, (index) {
              Customer_wishlist customerWishlist =
                  store1.customer.customer_wishlists![index];
              return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  surfaceTintColor: Colors.white,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Image.network(
                                    customerWishlist.product.product_images[0]
                                        .product_image_url,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 4, 4, 4),
                                            child: Text(
                                                customerWishlist.product.name)),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "${customerWishlist.shoe_size.size_type} ${customerWishlist.shoe_size.size_number}",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite),
                                  color: Colors.red,
                                ))
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "Lowest Price",
                                style: TextStyle(color: Colors.black54),
                              ),
                              TextBahtCurrency(
                                price: customerWishlist
                                    .product.lowest_selling_price,
                                textColor: Colors.green,
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text("Store Price",
                                  style: TextStyle(color: Colors.black54)),
                              TextBahtCurrency(
                                price: customerWishlist.product.store_price,
                                textColor: Colors.black,
                              ),
                            ],
                          ))
                        ],
                      ),
                    )
                  ]));
            })),
          )
        ])));
  }
}
