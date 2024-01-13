import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/screen/notification_details_page.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Sports shoes on sale at the end of the year',
      'subtitle':
          'Skecher brand shoes and Nike brand shoes. There are many pairs, many styles, many prices to choose from.',
      'image':
          'https://img-prod.api-onscene.com/cdn-cgi/image/format=auto,width=1600/https://sls-prod.api-onscene.com/partner_files/trueidintrend/31135/FB535E6B-5A4A-4B5B-8566-BFE88DBC7356.jpeg',
      'time': DateTime.now().subtract(Duration(days: 5)), // 5 days ago
      'clicked': false, // Initial state is not clicked
      'description':
          'Most of the Skecher brand shoes you see are casual shoes for women. Similar to court shoes, casual shoes, sports shoes, running shoes, discounts of more than 50 percent of the actual shoe price. What is special about Skecher brand shoes? After getting your hands on the shoes, you found that The soles are soft. There is a raised button in the middle of the shoe. When worn, the feet will be comfortable. and supports the weight of the feet well Including the fabric of the shoes, they are made from good quality fabric. They look colorful, emphasizing pastel colors. relevant to the present day That sweet girls like pastel colors and are popular, and sports shoes for men are darker colors. The design emphasizes on making the shoes look chic. Not bulky when wearing The important thing is that the soles are soft.',
    },
    {
      'title': 'Buy 1 get 1 free',
      'subtitle':
          'When you buy 1 pair of Slip on shoes, get one free! 1 more pair (value 1,295 baht)',

      'image':
          'https://scontent.fvte5-1.fna.fbcdn.net/v/t1.6435-9/53518792_2062081890493660_4535850553976029184_n.jpg?stp=dst-jpg_p843x403&_nc_cat=104&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=UlFB6adLsGQAX9EuknX&_nc_ht=scontent.fvte5-1.fna&oh=00_AfCrKYQwmmnphAjgxGYUN0LimgPmHxpmutrp3xlvXpVttw&oe=65AB96E8',
      'time': DateTime.now().subtract(Duration(hours: 8)), // 8 hours ago
      'clicked': false, // Initial state is not clicked
      'description': '*Special only for Big Card members. Use points to redeem special privileges for only 100 points. Press*783*45*378*13 digit ID card#Call for free *From 1 March 2019 - 30 April 2019 only!!! You can not miss this event...at every Mc Jeans store!! \n\n• For more information, please call 020-666-999. \n\n*condition \n• Special only for Big Card members, use points to redeem special privileges of only 100 points when purchasing 1 pair of Slip on shoes and receive 1 pair of Slip on shoes free (valued at 1,295 baht). \n• Participating products include McJeans, McLady. \n• You can participate in this promotion at every Mc Jeans store. \n• You can contact the sales staff at every Mc Jeans store for more details.',

    },
    {
      'title': 'Notification 3',
      'subtitle':
          'Something happened now',

      'image':
          'https://www.wordstream.com/wp-content/uploads/2021/07/sales20promotion20examples20buy20one20get20one20free20papa20johns20pizza_0.png',
      'time': DateTime.now().subtract(Duration(minutes: 30)), // 30 minutes ago
      'clicked': true, // Initial state is clicked
      'description': 'Description for the third notification',
    },
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Set the height of the line
          child: Container(
            color: Colors.grey, // Set the color of the line
            height: 0.5, // Set the height of the line
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showNotificationDetails(
                notifications[index]['title'],
                notifications[index]['image'],
                notifications[index]
                    ['description'], // Use the description from the list

                DateTime.now(), // Pass the actual notification time
              );
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.0),
                          leading: Image.network(
                            notifications[index]['image'],
                            width: 60.0,
                            height: 70.0,
                          ),
                          title: Text(
                            notifications[index]['title'],
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            notifications[index][
                                'subtitle'], // Use the description from the list
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: notifications[index]['clicked']
                              ? null // No red icon if clicked
                              : Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 12.0, // Adjust the size as needed
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                          child: Text(
                            _formatTimeDifference(notifications[index]['time']),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                PreferredSize(
                  preferredSize:
                      Size.fromHeight(1.0), // Set the height of the line
                  child: Container(
                    color: Colors.grey, // Set the color of the line
                    height: 0.5, // Set the height of the line
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showNotificationDetails(String title, String imageUrl,
      String description, DateTime notificationTime) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationDetailsPage(
          title: title,
          imageUrl: imageUrl,
          description: description,
          notificationTime: notificationTime,
        ),
      ),
    );
  }

  String _formatTimeDifference(DateTime notificationTime) {
    Duration difference = DateTime.now().difference(notificationTime);
    print('Time difference: $difference');

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return 'about ${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return 'about ${difference.inMinutes} mins ago';
    } else {
      return 'Just now';
    }
  }
}
