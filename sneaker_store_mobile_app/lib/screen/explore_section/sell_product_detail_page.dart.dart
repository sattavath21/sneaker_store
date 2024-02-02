//===> class: SaleProductDetailPage
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sneaker_store_mobile_app/component/my_checkbox.dart';
import 'package:sneaker_store_mobile_app/component/selected_product_header.dart';
import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/shoe_size.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class SellProductDetailPage extends StatefulWidget {
  final double selectedShoeSize;
  final Product product;

  const SellProductDetailPage(
      {super.key, required this.selectedShoeSize, required this.product});

  @override
  State<SellProductDetailPage> createState() => _SellProductDetailPageState();
}

class _SellProductDetailPageState extends State<SellProductDetailPage> {
  
  bool productNoDefect = false;
  bool boxNoDefect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SellProductDetail"),
      ),
      body: Container(
        color: Color.fromARGB(255, 246, 246, 246),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product details
              
Container(
      color: Colors.white,
      child: ListTile(
        leading:
            Image.network(widget.product.productImages[0].productImageUrl),
        title: Text(
          widget.product.name,
          style: app_text_style.latoStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
              style: app_text_style.latoStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black54,
                height: 2
              ),
              children: <TextSpan>[
                TextSpan(text: 'SKU: '),
                TextSpan(text: widget.product.SKU),
                TextSpan(text: '\nSize: ${widget.selectedShoeSize}', style: app_text_style.latoStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black54,
                height: 1
              ))
              ]),
        ),
      ),
    ),



              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Card(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  surfaceTintColor: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          child: Text("Pricing", style: app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(),
                              focusedErrorBorder: OutlineInputBorder(),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              CurrencyTextInputFormatter(
                                locale: 'th_TH',
                                symbol: '฿',
                                decimalDigits: 0,
                              )
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ]),
                ),
              ),

              // Size details and Size Chart
Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Card(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    surfaceTintColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          child: Text("Condition", style: app_text_style.latoStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        ListTile(
                          leading: Text(
                            "The product is brand-new",
                            style: app_text_style.latoStyle(fontSize: 14),
                          ),
                          trailing: Checkbox(
                            onChanged: (value) {
                              setState(() {
                                boxNoDefect = value as bool;
                                productNoDefect = value as bool;
                              });
                            },
                            value: boxNoDefect || productNoDefect,
                            activeColor: Colors.orange,
                            fillColor: MaterialStateColor.resolveWith((states) {
                              // Define different colors for different states
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .red; // Color when checkbox is selected
                              }
                              return Colors.black12; // Default color
                            }),
                          ),
                        ),
                      ],
                    )),
                    
              ),

Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Card(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Text(
                        "The product has no defect",
                        style: app_text_style.latoStyle(fontSize: 14),
                      ),
                      trailing: Checkbox(
                        onChanged: (value) {
                          setState(() {
                            productNoDefect = value as bool;
                          });
                        },
                        value: productNoDefect,
                        fillColor: MaterialStateColor.resolveWith((states) {
                          // Define different colors for different states
                          if (states.contains(MaterialState.selected)) {
                            return Colors
                                .red; // Color when checkbox is selected
                          }
                          return Colors.black12; // Default color
                        }),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Card(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    surfaceTintColor: Colors.white,
                    child: ListTile(
                      leading: Text(
                        "The box has no defects",
                        style: app_text_style.latoStyle(fontSize: 14),
                      ),
                      trailing: Checkbox(
                        onChanged: (value) {
                          setState(() {
                            boxNoDefect = value as bool;
                          });
                        },
                        value: boxNoDefect,
                        activeColor: Colors.orange,
                        fillColor: MaterialStateColor.resolveWith((states) {
                          // Define different colors for different states
                          if (states.contains(MaterialState.selected)) {
                            return Colors
                                .red; // Color when checkbox is selected
                          }
                          return Colors.black12; // Default color
                        }),
                      ),
                    )),
                    
              ),

              


            ],
          ),
        ),
      ),
    );
  }
}

//ec