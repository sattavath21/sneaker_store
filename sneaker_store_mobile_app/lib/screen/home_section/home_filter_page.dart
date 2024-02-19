//=== class: RecentPage
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/component/product_overview.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';


class HomeFilterPage extends StatelessWidget {
  const HomeFilterPage({
    super.key,
    required this.filteredProducts,
    required this.filterContent
  });

  final List<Product> filteredProducts;
  final String filterContent;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          filterContent,
          style: app_text_style.latoStyle(fontWeight: FontWeight.bold,fontSize: 18),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Colors.black26,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(8.0), // Adjust the margin as needed
                child: Text(
                  '${filteredProducts.length} Results',
                  style: app_text_style.latoStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: List.generate(
                  filteredProducts.length,
                  (index) {
                    Product product = filteredProducts[index];
                    return                 ProductOverview(product:product);
    
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} //ec
