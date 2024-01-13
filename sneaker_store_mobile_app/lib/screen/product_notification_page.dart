//===> class: CategoryHeader
import 'package:flutter/material.dart';


// Maintain a list to track the selected state of each box
  List<bool> isSelectedList = List.generate(8, (index) => false);

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