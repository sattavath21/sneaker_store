// notification_details_page.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final DateTime notificationTime;

  NotificationDetailsPage({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.notificationTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 260.0, // Adjust the height as needed
                  ),
                  ListTile(
                    title: Text(
                      title,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      DateFormat('MMM d, y H:mm a').format(notificationTime),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      description,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle button click
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjusted padding
            ),
            fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(50.0)), // Adjusted height
          ),
          child: Text(
            'Read More',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
