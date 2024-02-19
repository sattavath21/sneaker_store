import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/model/address.dart';


class AddressInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Address'),
      ),
      body: AddressForm(),
    );
  }
}

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  String _sellerName = '';
  String _sellerTelNumber = '';
  String _province = '';
  String _city = '';
  String _village = '';
  String _addressDetail = '';
  String _postCode = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Seller Name'),
              onChanged: (value) {
                setState(() {
                  _sellerName = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter seller name';
                }
                return null;
              },
            ),
            // Repeat similar TextFormFields for other address fields
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Save the address
                  Address newAddress = Address(
                    sellerName: _sellerName,
                    sellerTelNumber: _sellerTelNumber,
                    province: _province,
                    city: _city,
                    village: _village,
                    addressDetail: _addressDetail,
                    postCode: _postCode,
                  );
                  // Process the new address (e.g., save to database)
                  // Then navigate back to previous page
                  Navigator.pop(context);
                }
              },
              child: Text('Save Address'),
            ),
          ],
        ),
      ),
    );
  }
}