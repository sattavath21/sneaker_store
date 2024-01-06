import 'package:provider/provider.dart';
//===> class: ExplorePage
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/screen/buy_product_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';

//===> class: collectionDetailPage
class CollectionDetailPage extends StatelessWidget {
  final productSizes;
  final productImageUrl;
  final storePrice;
  final amountSold;
  final productName;
  // Maintain a list to track the selected state of each box
  List<bool> isSelectedList = List.generate(8, (index) => false);
  CollectionDetailPage({
    required this.productSizes,
    required this.productImageUrl,
    required this.storePrice,
    required this.amountSold,
    required this.productName,
  });
  @override
  Widget build(BuildContext context) {
    // Dummy image URLs for testing, replace with your actual URLs
    List<String> imageUrls = [
      'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-1.jpg',
      'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-2.jpg',
      'https://d2cva83hdk3bwc.cloudfront.net/adidas-samba-og-black-white-gum-3.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement the share button action
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
                visible: productSizes != null,
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
              buildSlidablePictures(imageUrls),

              // Product details
              buildProductDetails(),

              // Product dropdowns
              buildDropdown("Product Detail", [
                buildProductDetailItem("Brand", "Nike"),
                buildProductDetailItem("SKU", "123456"),
                buildProductDetailItem("Colorway", "Black/White"),
                // TODO: Add more product details
              ]),

              // Shipping method dropdown
              buildDropdown("Shipping Method", [
                buildShippingMethodItem(
                    "Standard Shipping", "Delivery in 3-5 days"),
                // TODO: Add more shipping methods
              ]),

              // Authenticity and Fraud icons
              buildAuthenticityAndFraudIcons(),

              // Frequency graph
              buildFrequencyGraphPlaceholder(), // Replace with actual implementation

              // Statistics
              buildStatistics(),
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
            ElevatedButton(
              onPressed: () {

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
              child: Text(
                'Sell',
                style: app_text_style.latoStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BuyProductPage()), // Replace SellPage with the page you want to navigate to
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 1, 214, 61), // Background color for the Buy button
                fixedSize: Size(220, 50), // Adjust width and height as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child: Text(
                'Buy',
                style: app_text_style.latoStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Implement other functions (buildProductDetails, buildAuthenticityAndFraudIcons, buildBottomNavigationBar, etc.)
// Helper function to build Slidable Pictures
  Widget buildSlidablePictures(List<String> imageUrls) {
    return Container(
      height: 300.0, // Adjust the height as needed
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

// Helper function to build product details
  Widget buildProductDetails() {
    // TODO: Replace these values with the actual product details
    String productName = "Product Name";
    String startingPrice = "฿3,200";
    String highestBidPrice = "฿4,200";
    String lastSaleInBaht = "฿3,880";

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
                15, 25, 0, 0), // Add margin to the bottom of the product name
            child: Text(productName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
              height:
                  16), // Adjust the vertical spacing between product name and details boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Box for Starting Price
              buildDetailsBox("Starting from", startingPrice),
              // Box for Highest Bid Price
              buildDetailsBox("Highest Bid", highestBidPrice),
              // Box for Last Sale in Baht
              buildDetailsBox("Last Sale", lastSaleInBaht),
            ],
          ),
        ],
      ),
    );
  }

// Helper function to build individual details box
  Widget buildDetailsBox(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center, // Center the text
        ),
        SizedBox(height: 16), // Adjust the vertical spacing between boxes
      ],
    );
  }

  // Helper function to build dropdowns
  Widget buildDropdown(String title, List<Widget> items) {
    return ExpansionTile(
      title: Text(
        title,
        style:
            app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),

      children: items,
      initiallyExpanded: true, // Expand the dropdown by default
      collapsedIconColor: Colors.black, // Set collapsed arrow color
    );
  }

  // Helper function to build items inside the dropdown
  Widget buildProductDetailItem(String label, String value) {
    return ListTile(
      title: Text(
        label,
        style: app_text_style.latoStyle(
            fontWeight: FontWeight.normal, fontSize: 18, color: Colors.grey),
      ),
      trailing: Text(
        value,
        style:
            app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  // Helper function to build items inside the dropdown
  Widget buildShippingMethodItem(String title, String subtitle) {
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

// Helper function to build authenticity and fraud icons with border
  Widget buildAuthenticityAndFraudIcons() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIconWithBorder(Icons.verified, "100% Authentic Guarantee"),
          buildIconWithBorder(Icons.security, "Anti Fraudulent Transaction"),
        ],
      ),
    );
  }

// Helper function to build icon with text and border
  Widget buildIconWithBorder(IconData icon, String text) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        border: Border.all(color: Colors.black54, width: 1), // Add a border
        borderRadius: BorderRadius.circular(6), // Add rounded corners
      ),
      padding: EdgeInsets.all(2), // Adjust padding as needed
      child: buildIconWithText(icon, text),
    );
  }

// Helper function to build icon with text
  Widget buildIconWithText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        Text(
          text,
          textAlign: TextAlign.center,
          style: app_text_style.latoStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // Helper function to build frequency graph placeholder
  Widget buildFrequencyGraphPlaceholder() {
    return Container(
      height: 200, // Adjust height as needed
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200], // Adjust color as needed
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 5),
                FlSpot(1, 8),
                FlSpot(2, 12),
                // Add more FlSpot as needed
              ],
              isCurved: true, // Add this line to make the line curved
              color: Colors.blue, // Color of the line
              belowBarData: BarAreaData(show: false), // Hide below bar data
            ),
          ],
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueAccent,
            ),
            touchCallback:
                (FlTouchEvent touchEvent, LineTouchResponse? touchResponse) {
              // Handle touch response
            },
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }

  // Helper function to build statistics text boxes
  Widget buildStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            color: const Color.fromARGB(31, 128, 128, 128),
            padding: EdgeInsets.fromLTRB(70, 14, 70, 14),
            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: buildStatisticBox("Sold", "211 Items")),
        Container(
            color: const Color.fromARGB(31, 128, 128, 128),
            padding: EdgeInsets.fromLTRB(70, 14, 70, 14),
            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: buildStatisticBox(
                "Average Price", "฿5,212")), // Adjust value as needed
      ],
    );
  }

  // Helper function to build individual statistic box
  Widget buildStatisticBox(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black87),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
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
                    'Product Name',
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
                          (index) => buildSelectableBox(index + 1, index),
                        ),
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

  Widget buildSelectableBox(int price, int index) {
    return GestureDetector(
      onTap: () {
        // Toggle the selected state when the box is tapped
        isSelectedList[index] = !isSelectedList[index];
      },
      child: Container(
        margin: EdgeInsets.all(8),
        width: 50,
        height: 50,
        color: isSelectedList[index] ? Colors.black : Colors.white,
        child: Center(
          child: Text(
            '\$$price',
            style: TextStyle(
              color: isSelectedList[index] ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
