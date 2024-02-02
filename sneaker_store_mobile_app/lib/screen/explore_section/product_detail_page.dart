import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
//===> class: ExplorePage
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/category_header.dart';
import 'package:sneaker_store_mobile_app/component/product_overview.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/product_image.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/buy_product_size_selection_page.dart';
import 'package:sneaker_store_mobile_app/screen/explore_section/sell_product_size_selection_page.dart';
import 'package:sneaker_store_mobile_app/screen/home_section/recent_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';

//===> class: collectionDetailPage
class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Maintain a list to track the selected state of each box
  List<bool> isSelectedList = List.generate(8, (index) => false);

 Route _createRoute(bool goToBuyProductSizeSelectionPage) {

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => goToBuyProductSizeSelectionPage
        ? BuyProductSizeSelectionPage(product: widget.product)
        : SellProductSizeSelectionPage(product: widget.product),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin;
      if (goToBuyProductSizeSelectionPage) {
        begin = Offset(1.0, 0.0); // Adjusted to come from the right
      } else {
        begin = Offset(0.0, 1.0); // Adjusted to come from the bottom
      }
      
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
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Dummy image URLs for testing, replace with your actual URLs
    List<String> imageUrls = [
      'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg',
      'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-2.jpg',
      'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-3.jpg',
    ];

    
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement the share button action
              // TODO: Implement this
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Show the notification bottom sheet
              showNotificationBottomSheet(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: widget.product.productWithSizes != null,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(
                            255, 218, 234, 219), // Circle background color
                        radius:
                            10, // Adjust the radius to control the size of the circle
                        child: Icon(
                          Icons.bolt, // Use the lightning bolt icon
                          color: Colors.green, // Adjust the color of the icon
                          size: 15, // Adjust the size of the icon
                        ),
                      ),

                      SizedBox(
                          width: 8), // Adjust the spacing between icon and text
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

              // Slidable pictures
              SlidablePicture(productImages: widget.product.productImages),

              // BuildProductDetails
              BuildProductPrice(product: widget.product),

              DropDownWidget(title: "Product Detail", items: [
                DropDownItem(
                    label: "Brand",
                    value: widget.product.productCollection.brand.brandName),
                DropDownItem(label: "SKU", value: widget.product.SKU),
                DropDownItem(label: "Colorway", value: widget.product.colorway),
              ]),

              // Shipping method dropdown

              DropDownWidget(title: "Shipping Method", items: [
                DropDownItemShipping(
                    title: "Standard Shipping",
                    subtitle: "Delivery in 5-7 days")
              ]),

              // Authenticity and Fraud icons

              Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BorderIconWithText(
                        icon: Icons.verified, text: "100% Authentic Gurantee"),
                    BorderIconWithText(
                        icon: Icons.security,
                        text: "Anti Fraudulent Transaction"),
                  ],
                ),
              ),
              // Statistics
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      color: const Color.fromARGB(31, 128, 128, 128),
                      padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                      child: Center(
                          child:
                              StatisticBox(label: "Sold", value: "211 Items"))),
                  Container(
                      color: const Color.fromARGB(31, 128, 128, 128),
                      padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                      child: Center(
                          child: StatisticBox(
                              label: "Average Price",
                              value: "฿5,212"))), // Adjust value as needed
                ],
              ),

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
                product:store1.recentProductList[index],);
            },
          ),
        ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.of(context).push(_createRoute(false));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.black, // Background color for the Sell button
                  fixedSize: Size((screenWidth / 2) - 16,
                      50), // Adjust width and height as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                ),
                child: Text(
                  'Sell',
                  style: app_text_style.latoStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute(true));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 1, 214, 61), // Background color for the Buy button
                  fixedSize: Size((screenWidth / 2) - 16,
                      50), // Adjust width and height as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                ),
                child: Text(
                  'Buy',
                  style: app_text_style.latoStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Notify Me',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Image of the product
                  Image.network(
                    'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 8),
                  // Product name
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Description
                  Text(
                    "Get notified when the item's price drops or when the item becomes available",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  // Scrollable list of selectable grey boxes
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Color.fromARGB(255, 244, 244, 244),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            8,
                            (index) => SelectableBox(
                                isSelectedList: isSelectedList,
                                price: index + 1,
                                index: index)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  ),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromHeight(50.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_none, // Replace with the desired icon
                      color: Colors.white,
                    ),
                    SizedBox(width: 8), // Adjust spacing as needed
                    Text(
                      'Notify Me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SelectableBox extends StatefulWidget {
  final int price;
  final int index;
  const SelectableBox(
      {super.key,
      required this.isSelectedList,
      required this.price,
      required this.index});

  final List<bool> isSelectedList;

  @override
  State<SelectableBox> createState() => _SelectableBoxState();
}

class _SelectableBoxState extends State<SelectableBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Toggle the selected state when the box is tapped
        widget.isSelectedList[widget.index] =
            !widget.isSelectedList[widget.index];
      },
      child: Container(
        margin: EdgeInsets.all(8),
        width: 50,
        height: 50,
        color:
            widget.isSelectedList[widget.index] ? Colors.black : Colors.white,
        child: Center(
          child: Text(
            '\$${widget.price}',
            style: TextStyle(
              color: widget.isSelectedList[widget.index]
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticBox extends StatelessWidget {
  const StatisticBox({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.normal,
              fontSize: 10,
              color: Colors.black87),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}

class BorderIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  const BorderIconWithText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 247, 247),
          border: Border.all(color: Colors.black54, width: 1), // Add a border
          borderRadius: BorderRadius.circular(6), // Add rounded corners
        ),
        padding: EdgeInsets.all(2), // Adjust padding as needed
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black54),
            Text(
              text,
              textAlign: TextAlign.center,
              style: app_text_style.latoStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ));
  }
}

class DropDownItemShipping extends StatelessWidget {
  final String title;
  final String subtitle;

  const DropDownItemShipping(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor:
              Color.fromARGB(255, 249, 249, 249), // Circle background color
          radius: 20,
          child: Icon(Icons.local_shipping, color: Colors.black)),
      title: Text(
        title,
        style:
            app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: app_text_style.latoStyle(
            fontWeight: FontWeight.normal, fontSize: 12),
      ),
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String label;
  final String value;

  const DropDownItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: app_text_style.latoStyle(
            fontWeight: FontWeight.normal, fontSize: 16, color: Colors.grey),
      ),
      trailing: Text(
        value,
        style:
            app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

class DropDownWidget extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const DropDownWidget({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style:
            app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),

      children: items,
      initiallyExpanded: true, // Expand the dropdown by default
      collapsedIconColor: Colors.black, // Set collapsed arrow color
    );
  }
}

class BuildProductPrice extends StatelessWidget {
  const BuildProductPrice({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
                15, 25, 0, 0), // Add margin to the bottom of the product name
            child: Text(product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
              height:
                  16), // Adjust the vertical spacing between product name and details boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildPriceBox(
                  title: "Starting from",
                  value: product.startingPrice?.toString() ?? "No Price Yet!"),
              BuildPriceBox(
                  title: "Retail Price",
                  value: product.retailPrice?.toString() ?? "No Price Yet!"),
              BuildPriceBox(
                  title: "Last Sale",
                  value: product.lastSalePrice?.toString() ?? "No Price Yet!")
            ],
          ),
        ],
      ),
    );
  }
}

class SlidablePicture extends StatelessWidget {
  const SlidablePicture({super.key, required this.productImages});
  final List<ProductImage> productImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Adjust the height as needed
      child: PageView.builder(
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Image.network(
            productImages[index].productImageUrl,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

class BuildPriceBox extends StatelessWidget {
  final String title;
  final String value;
  const BuildPriceBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 8),
        Text(
          "${value} \u0e3f",
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
          textAlign: TextAlign.center, // Center the text
        ),
        SizedBox(height: 16), // Adjust the vertical spacing between boxes
      ],
    );
  }
}
