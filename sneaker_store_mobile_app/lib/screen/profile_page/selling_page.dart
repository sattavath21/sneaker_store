import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/central_data_store.dart';
import 'package:sneaker_store_mobile_app/model/product_selling.dart';

class SellingPage extends StatefulWidget {
  @override
  _SellingPageState createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  PageController listViewController = PageController();

  List<String> headerItems = [
    "Active Ask",
    "Pending",
    "Shipment",
    "In Progress",
    "Completed",
    "Canceled",
  ];

  int selectedPageIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              "Selling",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: listViewController,
              itemCount: headerItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPageIndex = index; // Update the selected index
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        bottom: BorderSide(
                          width: 1,
                          color: selectedPageIndex == index
                              ? Colors.green.shade700
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      headerItems[index],
                      style: TextStyle(
                        fontSize: 14,
                        color: selectedPageIndex == index
                            ? Colors.green.shade700
                            : Colors.black45,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Display different content based on the selected index
          SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: CupertinoSearchTextField(
                placeholder: "Search for listing",
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),

                  Expanded(
            child: SellingPageBodyContent(status: headerItems[selectedPageIndex]),
          ),
        ],
      ),
    );
  }
}

class SellingPageBodyContent extends StatelessWidget {
  const SellingPageBodyContent({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    //place this ref inside build()
    var store1 = Provider.of<CentralStore>(context);
    // Filter bills based on the order status
    List<ProductSelling> filteredProductSelling = store1.customer.productSellings!
        .where((productSelling) =>
            productSelling.orderStatus.statusName.toLowerCase() == status.toLowerCase())
        .toList();

    // Container for background color of the body content
    return Container(
        color: Colors.black12,
        // For Scrolling vertically in body
        child: SingleChildScrollView(
            child: Column(children: [
          // For space for the body
          Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 20),
            child: Wrap(
                children: List.generate(filteredProductSelling.length, (index) {
              return OrderBodyCard(productSelling: filteredProductSelling[index]);
            })),
          )
        ])));
  }
}

// * Extract the Card design
class OrderBodyCard extends StatelessWidget {
  const OrderBodyCard({
    super.key,
    required this.productSelling,
  });

  final ProductSelling productSelling;

  @override
  Widget build(BuildContext context) {
    return 
    Card(
      elevation: 2,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        surfaceTintColor: Colors.white,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Column(
                    children: [
Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Image.network(
                              productSelling.product.productImages[0].productImageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              "${productSelling.shoeSize.sizeType} ${productSelling.shoeSize.sizeNumber}",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(productSelling.product.name)),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("Qty: ${productSelling.qty}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    productSelling.productCondition
                                        .conditionName,
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  SizedBox(width: 30),
                                  Text("\u0E3F ${productSelling.customerPlacedPrice}")
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                              Divider(
              color: Colors.black12,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Order Live",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    productSelling.productLiveDate,
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            )
                    ],
                  )),

          ],
        ));
  }
}

