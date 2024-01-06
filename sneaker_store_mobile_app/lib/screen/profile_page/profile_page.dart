//===> class: ProfilePage
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/component/profile_list_tile.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/buying_page.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/edit_profile_page.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/logout_dialog.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/selling_page.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/setting_page.dart';
import 'package:sneaker_store_mobile_app/screen/profile_page/wishlist_page.dart';

class ProfilePage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [
        const SizedBox(
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
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Unverified",
                      style: TextStyle(fontSize: 14, color: Colors.amber))
                ],
              )
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              //move to new creen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ),
              );
            },
            icon: Icon(Icons.edit_rounded),
            color: Colors.black,
          ),
        ),

        SizedBox(height: 25,),
        ProfileListTile(iconData: Icons.shopping_basket_outlined, name: "Buying", subtitle: "Order Tracking", nextPage: BuyingPage()),
        Divider(color: Colors.black54,),

        ProfileListTile(iconData: Icons.sell_outlined, name: "Selling", subtitle: "Selling Request Tracking", nextPage: SellingPage(),),
        Divider(color: Colors.black54,),

        ProfileListTile(iconData: Icons.favorite_border_rounded, name: "Wishlist", subtitle: "Saved Items for listing updates & price drop alerts", nextPage: WishlistPage(),),
        Divider(color: Colors.black54,),

        ProfileListTile(iconData: Icons.settings_applications_outlined, name: "Setting", subtitle: "Shipping Branch, Payment, Language", nextPage: SettingPage(),),
        Divider(color: Colors.black54,),

        ProfileListTile(iconData: Icons.logout_rounded, name: "Log out", subtitle: "Log out from the application", nextPage: LogoutDialog(),),
        Divider(color: Colors.black54,)

      ]),
    );
  } //ef
}

//ec