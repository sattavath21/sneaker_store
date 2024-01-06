import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class BuyProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BuyProductPage"),
      ),
      body: Container(
        color: Color.fromARGB(255, 246, 246, 246),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product details
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Image.network('https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg'),
                title: Text(
                  'Product Name',
                  style: app_text_style.latoStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text('SKU: YourSKU',
                  style: app_text_style.latoStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),),
              ),
            ),
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
                          'Size',
                          style: app_text_style.latoStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigate to Size Chart page
                          },
                          child: Text(
                            'Size Chart',
                            style: app_text_style.latoStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Available prices
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price 1'), // Replace with actual price information
                          GestureDetector(
                            onTap: () {
                              // Handle box selection
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Pre-order button
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: ElevatedButton(
          onPressed: () {
            // Handle pre-order button click
          },
          style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // Background color for the Sell button
                fixedSize: Size(220, 50), // Adjust width and height as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
          child: Text('Pre-order',
                style: app_text_style.latoStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.white),),
        ),
      ),
    );
  }
}


