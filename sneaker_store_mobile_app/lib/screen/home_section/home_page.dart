// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
import 'package:sneaker_store_mobile_app/model/brand.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/bill.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/filter_brand_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/filter_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/most_poppular_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/recent_page.dart';
import 'package:sneaker_store_mobile_app/utils/route_util.dart';

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

  // ScrollController for tracking the GridView scroll

  @override
  void initState() {
    super.initState();
    // Attach a listener to the scroll controller to track scroll position changes
  }

  @override
  void dispose() {
    super.dispose();
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
                autoPlay: true,
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
          height: 10,
        ),
        CategoryHeader(header: "Shop By Brand", nextPage: FilterPage()),
        SizedBox(
            height: 725, // Adjust this height as needed
            child: GridView.custom(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => Tile(
                  index: index,
                  brandList: store1.brandList,
                ),
                childCount: 16,
              ),
            )),
    
        Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
          child: SizedBox(
              width: 190,
              child: CategoryHeader(
                  header: "RECENTLY VIEWED".tr(), nextPage: RecentPage())),
        )),
        SizedBox(
          height: 354,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: store1.recentProductList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductOverview(
                product: store1.recentProductList[index],
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: SizedBox(
            width: 354,
            child: Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent),
                  onPressed: () {
                    //move to new creen
                    Navigator.push(context,
                        RouteUtil.routeSlideTransition(FilterPage(), false));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons
                              .warehouse_rounded, // Use the lightning bolt icon
                          color: Colors.green, // Adjust the color as needed
                          size: 20, // Adjust the size of the icon
                        ),
                      ),
                      Text(
                        "IN STOCK - SHIP-READY".tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.arrow_forward_rounded)
                    ],
                  )),
            ),
          ),
        ),
        //TODO: Logically incoorect, change to show product with specific filter in the future
        SizedBox(
          height: 354,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: store1.recentProductList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductOverview(product: store1.recentProductList[index]);
            },
          ),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
          child: SizedBox(
              width: 190,
              child: CategoryHeader(
                  header: "MOST POPULAR".tr(), nextPage: MostPopularPage())),
        )),
        // TODO: Logically incorrect
        SizedBox(
          height: 354,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: store1.recentProductList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductOverview(product: store1.recentProductList[index]);
            },
          ),
        ),
      ]),
    );
  }
} //ec

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.index,
      this.extent,
      this.backgroundColor,
      required this.brandList})
      : super(key: key);

  final int index;
  final double? extent;
  final Color? backgroundColor;
  final List<Brand> brandList;

  @override
  Widget build(BuildContext context) {

   List<String> tileImages = [
    "https://www.superkicks.in/cdn/shop/files/1_28.png?v=1705666209",
    "https://www.superkicks.in/cdn/shop/files/air-max-3.jpg?v=1703858040&width=360",
    "https://www.superkicks.in/cdn/shop/files/2_78a9f762-5d5b-4e9a-a089-650585e45787.jpg?v=1705494943&width=360",
    "https://www.superkicks.in/cdn/shop/files/2_c4b53494-1643-4524-8982-e0a7797d67c1.jpg?v=1704802095&width=360"
      "https://www.superkicks.in/cdn/shop/files/1._1.png?v=1701948765",
    "https://www.superkicks.in/cdn/shop/files/2_6554e0bf-cacb-44bd-8e75-ae4b42a4fdea.jpg?v=1702994022&width=360"
      "https://www.superkicks.in/cdn/shop/files/POP_TRADING_CO_1.png?v=1706101888",
    "https://www.superkicks.in/cdn/shop/products/2_2048d017-99c0-4e43-b0ea-c622cb713af4.jpg?v=1706593023&width=360",
    "https://www.superkicks.in/cdn/shop/files/2_53222a06-0dc7-45d5-bdf7-f21689c5d088.jpg?v=1706191729&width=360",
    "https://www.superkicks.in/cdn/shop/products/2_409a944a-667a-478a-aa13-b53b5877a46a.jpg?v=1677498065&width=360",
    "https://www.superkicks.in/cdn/shop/products/2_0a22c424-1d00-4566-a1d1-df52961f4f5b.jpg?v=1677501573&width=360",
    "https://www.superkicks.in/cdn/shop/files/PHOTOSHOP4_a765bbc9-f472-4b83-b6ff-d7e1b6c8472d.jpg?v=1700287411&width=360",
    "https://www.superkicks.in/cdn/shop/products/2-136.jpg?v=1675961136&width=360",
    "https://cdn.flightclub.com/TEMPLATE/370034/1.jpg?width=2000",
    "https://www.superkicks.in/cdn/shop/files/2_811ea66b-26a1-42eb-bcf1-cd5833d7d667.jpg?v=1702377379&width=360",
    "https://www.superkicks.in/cdn/shop/files/3_26b4f16c-390a-4562-b9cd-4ff0a497be97.jpg?v=1701334961&width=360",
    "https://www.superkicks.in/cdn/shop/files/2._530d076a-420e-4984-9f82-869ba48b6ebf.jpg?v=1697715754&width=360",
    "https://www.superkicks.in/cdn/shop/files/2_4f38445b-6ca8-4300-a47c-c6e24b33bf67.jpg?v=1700207973&width=360"



    ];

  

   return Container(
          decoration: BoxDecoration(
              // Add your decoration here
              color: const Color.fromARGB(255, 237, 237, 237)),
          height: extent,
          child: Stack(
            children: [
              Image.network(
                  tileImages[index] ?? "erorr"
                          ,fit: BoxFit.cover, // Ensure the image fills the container
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.network(
                  brandList[0].brandLogo,
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ));
  }
}
