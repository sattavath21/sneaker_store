//=== class: RecentPage
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/product_overview.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/product_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/filter_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class RecentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Place this reference inside build()
    var store1 = Provider.of<CentralStore>(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Recently Viewed",
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
                  '${store1.recentProductList.length} Results',
                  style: app_text_style.latoStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: List.generate(
                  store1.recentProductList.length,
                  (index) {
                    Product product = store1.recentProductList[index];
                    return                 ProductOverview(product:product);

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } //ef
} //ec
