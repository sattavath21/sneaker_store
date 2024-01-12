//=== class: RecentPage
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/collection_detail_page.dart';
import 'package:sneaker_store_mobile_app/screen/filter_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class RecentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Place this reference inside build()
    var store1 = Provider.of<CentralStore>(context);

    return Scaffold(
      appBar: AppBar(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: product.product_with_sizes != null,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 16, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.bolt,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Ready to Ship',
                                      style: app_text_style.latoStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image.network(
                              product.product_images[0].product_image_url,
                              height: 160,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                            Visibility(
                              visible: product.amount_sold > 600,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                width: 250,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color.fromARGB(255, 233, 231, 231),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 6, 4),
                                        child: Image.asset(
                                          'assets/pic/fire.gif',
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      Text(
                                        '${product.amount_sold} Sold',
                                        style: app_text_style.latoStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
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
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text('STARTING FROM',
                                  style: app_text_style.latoStyle(
                                      fontWeight: FontWeight.normal, color: Colors.grey)),
                              subtitle: Text('${product.store_price} LAK',
                                  style: app_text_style.latoStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
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
      ),
    );
  } //ef
} //ec
