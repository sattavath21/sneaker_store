// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:mid_exam_doc_management/central_data_store.dart';
// import 'package:mid_exam_doc_management/screens/MultiSectionForm.dart';
// import 'package:mid_exam_doc_management/screens/app_navigation.dart';
// import 'package:mid_exam_doc_management/styles/app_text_styles.dart';
// import 'package:mid_exam_doc_management/models/Tqf3.dart';
// import 'package:mid_exam_doc_management/components/drawer/DrawerList.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/component/product_overview.dart';
import 'package:sneaker_store_mobile_app/component/category_header.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/bill.dart';
import 'package:sneaker_store_mobile_app/screen/filter_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_page/most_poppular_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_page/recent_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CentralStore store1;

  final List<String> imageUrls = [
    "https://i.pinimg.com/originals/db/18/b6/db18b62467059a01980e410e0ecedc3d.png",
    "https://w0.peakpx.com/wallpaper/178/512/HD-wallpaper-sneakers-hype-jordan-klekt-nike-shoes-stock-x-we-the-new.jpg",
    "https://wallpapercave.com/wp/wp2927394.jpg",
  ];

  int _currentIndex = 0;

  double _scrollProgress = 0.0;

  // ScrollController for tracking the GridView scroll
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Attach a listener to the scroll controller to track scroll position changes
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Method to update _scrollProgress based on the GridView scroll
  void _scrollListener() {
    setState(() {
      _scrollProgress = _scrollController.position.pixels /
          _scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<CentralStore>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Builder(
          builder: (context) {
            return CarouselSlider(
              options: CarouselOptions(
                height: 220,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                // autoPlay: false,
              ),
              items: imageUrls
                  .map((item) => Container(
                        child: Center(
                            child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                        )),
                      ))
                  .toList(),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200, // Adjust this height as needed
          child: GridView.builder(
            controller: _scrollController, // Assign the ScrollController here
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: store1.brandList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: MaterialButton(
                      minWidth: 60,
                      height: 60,
                      colorBrightness: Brightness.light,
                      color: Colors.white70,
                      shape: CircleBorder(),
                      child: Image(
                        image: NetworkImage(store1.brandList[index].brand_logo),
                        color: Colors.black,
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        // do something
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: Text(
                        store1.brandList[index].brand_name,
                        style: TextStyle(fontSize: 11),
                      ))
                ],
              );
            },
          ),
        ),
        SizedBox(
          width: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: LinearProgressIndicator(
              value: _scrollProgress,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.black26,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black54),
            ),
          ),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
          child: SizedBox(
              width: 190,
              child: CategoryHeader(
                  header: "RECENTLY VIEWED".tr(), nextPage: RecentPage())),
        )),
        SizedBox(height: 354, child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: store1.recentProductList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductOverview(
                productSizes: store1.recentProductList[index].product_with_sizes,
                productImageUrl: store1.recentProductList[index]
                    .product_images[0].product_image_url,
                storePrice: store1.recentProductList[index].store_price,
                amountSold: store1.recentProductList[index].amount_sold,
                productName: store1.recentProductList[index].name);
          },
        ),)
        ,
        Padding(padding: EdgeInsets.only(top: 16),  
        child: SizedBox(
          width: 354,
          child: Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.transparent),
                onPressed: () {
                  //move to new creen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                                Icon(
                                  Icons.bolt, // Use the lightning bolt icon
                                  color:
                                      Colors.green, // Adjust the color as needed
                                  size: 20, // Adjust the size of the icon
                                ),
                        
                    Text(
                      "READY TO SHIP".tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.arrow_forward_rounded)
                  ],
                )),
          ),
        ),)
        ,
        //TODO: Logically incoorect, change to show product with specific filter in the future
        SizedBox(height: 354, child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: store1.recentProductList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductOverview(
                productSizes: store1.recentProductList[index].product_with_sizes,
                productImageUrl: store1.recentProductList[index]
                    .product_images[0].product_image_url,
                storePrice: store1.recentProductList[index].store_price,
                amountSold: store1.recentProductList[index].amount_sold,
                productName: store1.recentProductList[index].name);
          },
        ),),
        Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
          child: SizedBox(
              width: 190,
              child: CategoryHeader(
                  header: "MOST POPULAR".tr(), nextPage: MostPopularPage())),
        )),
        // TODO: Logically incorrect
        SizedBox(height: 354, child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: store1.recentProductList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductOverview(
                productSizes: store1.recentProductList[index].product_with_sizes,
                productImageUrl: store1.recentProductList[index]
                    .product_images[0].product_image_url,
                storePrice: store1.recentProductList[index].store_price,
                amountSold: store1.recentProductList[index].amount_sold,
                productName: store1.recentProductList[index].name);
          },
        ),),
      ]),
    );
  }
} //ec
