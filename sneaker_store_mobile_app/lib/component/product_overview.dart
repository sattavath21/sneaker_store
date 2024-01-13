//===> class: ProductOverview
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/screen/collection_detail_page.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class ProductOverview extends StatelessWidget {
  final productSizes;
  final productImageUrl;
  final storePrice;
  final amountSold;
  final productName;

  ProductOverview({
    required this.productSizes,
    required this.productImageUrl,
    required this.storePrice,
    required this.amountSold,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollectionDetailPage(
              productSizes: productSizes,
              productImageUrl: productImageUrl,
              storePrice: storePrice,
              amountSold: amountSold,
              productName: productName,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            Visibility(
              visible: productSizes != null,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 16, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.bolt, // Use the lightning bolt icon
                      color: Colors.green, // Adjust the color as needed
                      size: 20, // Adjust the size of the icon
                    ),
                    SizedBox(
                        width: 4), // Adjust the spacing between icon and text
                    Text(
                      'Ready to Ship'.tr(),
                      style: app_text_style.latoStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10, // Adjust the font size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Display collection image (you may need to update this)
            Image.network(
              productImageUrl,
              height: 160,
              width: 200,
              fit: BoxFit.contain,
            ),
            // Container for the grey box
            SizedBox(
              height: 40,
              child: Visibility(
                visible: amountSold > 600,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  width: 250, // Adjust the width of the grey box
                  height: 25, // Adjust the height of the grey box
                  color: Color.fromARGB(
                      255, 233, 231, 231), // Change the color as needed
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Add an Image.asset widget here
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 6, 4),
                          child: Image.asset(
                            'assets/pic/fire.gif', // Replace with the actual path to your local image
                            height: 20, // Adjust the height of the image
                            width: 20, // Adjust the width of the image
                            // You should place your local image in the 'assets' folder and update the path accordingly
                          ),
                        ),
                      
                        RichText(text: TextSpan(
                                    style: app_text_style.latoStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10, // Adjust the font size
                                    ),
    children: <TextSpan>[
      TextSpan(text: "${amountSold} "),
      TextSpan(text: "Sold".tr()),
    ],
  ), )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 46,
              child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 6, 0, 0),
              child: Text(
                productName,
                style: app_text_style.latoStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14, // Adjust the font size
                ),
              ),
            ),
            )
            , // Adjust the vertical spacing between image and ListTile
            // Display collection name using ListTile
            ListTile(
              title: Text('STARTING FROM'.tr(),
                  style: app_text_style.latoStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey)),
              subtitle: Text('\u0E3F${storePrice}',
                  style: app_text_style.latoStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  } //ef
}//ec