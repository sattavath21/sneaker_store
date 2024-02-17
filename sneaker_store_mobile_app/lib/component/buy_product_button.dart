// ignore_for_file: public_member_api_docs, sort_constructors_first
//===> class: BuyProductButton
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/styles/app_text_styles.dart';

class BuyProductButton extends StatelessWidget {
  Color? borderColor = Colors.transparent;
  final Color backgroundColor;
  final String text;
  final Function? onPressed;

  BuyProductButton({
    Key? key,
    this.borderColor,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,

  }) : super(key: key);

  Icon getIcon(String text) {
    switch (text.toLowerCase()) {
      case "standard":
        return Icon(
          Icons.groups_2_rounded,
          color: Colors.black,
          size: 20,
        );
      case "pre-order":
        return Icon(Icons.flight_rounded, color: Colors.white,size: 20,);
      case "ship-ready":
        return Icon(Icons.warehouse_rounded, color: Colors.white,size: 18,);
      default:
        return Icon(Icons.error,size: 20,);
    }
  }

  String getDeliveryDuration(String text) {
    switch (text.toLowerCase()) {
      case "standard":
        return "5-10 DAYS";
      case "pre-order":
        return "1-2 WEEKS";
      case "ship-ready":
        return "3-5 DAYS";
      default:
        return "ERROR";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: getIcon(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.65,
            MediaQuery.of(context).size.height * 0.095),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: text.toLowerCase() == "standard"
                ? Colors.black
                : Colors.transparent, // Set the border color
          ),
        ),
      ),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(

            text: TextSpan(

              style: app_text_style.latoStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                height: 2,
                color: text.toLowerCase() == "standard"
                    ? Colors.black
                    : Colors.white,
                
              ),
              children: <TextSpan>[
                TextSpan(
                  text: text,
                  style: app_text_style.latoStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: text.toLowerCase() == "standard"
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                TextSpan(text: '\n ${getDeliveryDuration(text)}', style: app_text_style.latoStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    height: 2,
                    color: text.toLowerCase() == "standard"
                        ? Colors.black54
                        : Colors.white70,
                  )),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Text(
            "Some Price",
            style: app_text_style.latoStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: text.toLowerCase() == "standard"
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ],
      ),
      onPressed: onPressed as void Function()?,
  
    );
  }
}
