import "package:flutter_form_builder/flutter_form_builder.dart";
import 'package:form_builder_validators/form_builder_validators.dart';
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
    final _formKey = GlobalKey<FormBuilderState>();

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
                FormBuilder(
                    key: _formKey,
                    initialValue: {
                      'firstName': store1.customer.firstName,
                      'lastName': store1.customer.lastName,
                      'email': store1.customer.email,
                      'birthday': store1.customer.birthday,
                    },
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormBuilderTextField(
                                name: "firstName",
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                  labelText: "Firstname",
                                  labelStyle: app_text_style.latoStyle(),
                                ),
                                onChanged: (val) {
                                  store1.setCustomerFirstname(val!);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.maxLength(5, errorText: "Must be between 1 and 50 characters long")
                                ]),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormBuilderTextField(
                                name: "lastName",
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                    labelText: "Lastname",
                                    labelStyle: app_text_style.latoStyle()),
                                onChanged: (val) {
                                  store1.setCustomerFirstname(val!);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormBuilderTextField(
                                name: "email",
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                    labelText: "Email",
                                    labelStyle: app_text_style.latoStyle()),
                                onChanged: (val) {
                                  store1.setCustomerFirstname(val!);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormBuilderTextField(
                                
                                
                                name: "birthday",
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  errorBorder: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(),
                                    labelText: "Birthday",
                                    labelStyle: app_text_style.latoStyle()),
                                onChanged: (val) {
                                  store1.setCustomerFirstname(val!);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),

                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                elevation: 2
                              ),
                              onPressed: () {
                                bool validationSuccess = _formKey.currentState!.validate();
                                
                                if (validationSuccess) {
                                   _formKey.currentState?.save();
                                }

                              },
                              child: Text('SAVE', style: app_text_style.latoStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      )
                    ]))
              ],
            ),
          )),
    );
  }
}//ec