import 'package:provider/provider.dart';
//===> class: undefined
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://scontent.fvte1-1.fna.fbcdn.net/v/t1.6435-9/48395999_2704873933071462_7859657334111338496_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=be3454&_nc_eui2=AeGFDOga71IjDXE1I9qU821viNvYi-zwb56I29iL7PBvnrQ306Zlshlp6czMtFH3vdlmad3Vb_dbWkN72_MACWci&_nc_ohc=1bDYhdNy4acAX8VSEPl&_nc_ht=scontent.fvte1-1.fna&oh=00_AfDfQSq30o4J1X_W98KHM9K3Xn9R6GU0rKQlO3xB3p89Zw&oe=65A4BAD0")),
            subtitle: Column(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Sattavath",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.amber,
                      size: 16,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Unverified",
                        style: TextStyle(fontSize: 12, color: Colors.amber))
                  ],
                )
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                //move to new creen
              },
              icon: Icon(Icons.edit),
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      style: app_text_style.latoStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12, // Adjust the font size
                      ),
                      children: [
                    TextSpan(text: "Name:  "),
                    TextSpan(
                        text: store1.customer.firstName,
                        style: TextStyle(color: Colors.black87)),
                  ])),
              RichText(
                  text: TextSpan(
                      style: app_text_style.latoStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12, // Adjust the font size
                      ),
                      children: [
                    TextSpan(text: "Email:  "),
                    TextSpan(
                        text: store1.customer.email,
                        style: TextStyle(color: Colors.black87)),
                  ])),
              RichText(
                  text: TextSpan(
                      style: app_text_style.latoStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12, // Adjust the font size
                      ),
                      children: [
                    TextSpan(text: "Birthday:  "),
                    TextSpan(
                        text: store1.customer.birthday,
                        style: TextStyle(color: Colors.black87)),
                  ])),
            ],
          )
        ],
      ),
    );
  } //ef
}//ec