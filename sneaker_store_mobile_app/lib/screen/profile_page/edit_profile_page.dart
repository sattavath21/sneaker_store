import 'package:provider/provider.dart';
//===> class: undefined
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);
    TextEditingController _firstNameFieldController = TextEditingController();
        TextEditingController _lastNameFieldController = TextEditingController();
    TextEditingController _emailController = TextEditingController();

    TextEditingController _usernameContoller = TextEditingController();
    TextEditingController _birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set the initial value for the TextField
    _firstNameFieldController.text = store1.customer.firstName;
    _lastNameFieldController.text = store1.customer.lastName;
    _emailController.text = store1.customer.email;
    _birthdayController.text = store1.customer.birthday;
  }

    return Scaffold(
      backgroundColor: Color.fromARGB(233, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: _firstNameFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),

              
            ),
          ),
        ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}//ec