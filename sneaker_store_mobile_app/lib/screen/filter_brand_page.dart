import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/collection_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/filter_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class FilterBrandPage extends StatelessWidget {
  final String selectedName;

  FilterBrandPage({required this.selectedName});

  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);
    // Filter products based on the selected brand name
    List<Product> filteredProducts = store1.productLists.where((product) {
      print(
          'Product Brand Name: ${product.productCollection.brand.brandName}');
      print('Selected Brand Name: $selectedName');
      return product.productCollection.brand.brandName.toLowerCase() ==
          selectedName.toLowerCase();
    }).toList();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text(
          "$selectedName",
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  '${filteredProducts.length} Results',
                  style: app_text_style.latoStyle(fontWeight: FontWeight.w400),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: List.generate(
                    filteredProducts.length,
                    (index) {
                      Product product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to another page with details about the selected collection
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilterPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align children to the start (left)
                            children: [
                              Visibility(
                                visible: product.productWithSizes != null,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 16, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bolt, // Use the lightning bolt icon
                                        color: Colors
                                            .green, // Adjust the color as needed
                                        size: 20, // Adjust the size of the icon
                                      ),
                                      SizedBox(
                                          width:
                                              4), // Adjust the spacing between icon and text
                                      Text(
                                        'Ready to Ship',
                                        style: app_text_style.latoStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14, // Adjust the font size
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Display collection image (you may need to update this)
                              Image.network(
                                product.productImages[0].productImageUrl,
                                height: 160,
                                width: 200,
                                fit: BoxFit.contain,
                              ),
                              // Container for the grey box
                              Visibility(
                                visible: product.amountSold > 600,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  width: 250, // Adjust the width of the grey box
                                  height: 30, // Adjust the height of the grey box
                
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color.fromARGB(255, 233, 231,
                                        231), // Change the color as needed
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Add an Image.asset widget here
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 6, 4),
                                          child: Image.asset(
                                            '/pic/fire.gif', // Replace with the actual path to your local image
                                            height:
                                                20, // Adjust the height of the image
                                            width:
                                                20, // Adjust the width of the image
                                            // You should place your local image in the 'assets' folder and update the path accordingly
                                          ),
                                        ),
                                        Text(
                                          '${product.amountSold} Sold',
                                          style: app_text_style.latoStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14, // Adjust the font size
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14, 6, 0, 0),
                                child: Text(
                                  product.name,
                                  style: app_text_style.latoStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14, // Adjust the font size
                                  ),
                                ),
                              ), // Adjust the vertical spacing between image and ListTile
                              // Display collection name using ListTile
                              ListTile(
                                title: Text('STARTING FROM',
                                    style: app_text_style.latoStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey)),
                                subtitle: Text('${product.storePrice} LAK',
                                    style: app_text_style.latoStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
