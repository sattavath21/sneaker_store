import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/product_overview.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/product_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/home_filter_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class FilterExplorePage extends StatelessWidget {
  final String selectedName;

  FilterExplorePage({required this.selectedName});

  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);
    // Filter products based on the selected brand name
    List<Product> filteredProducts = store1.productLists.where((product) {
  
      return product.productCollection.brand.brandName.toLowerCase() ==
          selectedName.toLowerCase();
    }).toList();

       
      print('Selected Brand Name: $selectedName');

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
                      return ProductOverview(product: product);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
