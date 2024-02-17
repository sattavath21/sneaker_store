//===> class: CategoryHeader
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/utils/route_util.dart';

class CategoryHeader extends StatelessWidget{
    final String header;
  final Widget nextPage;

  CategoryHeader({
    required this.header,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context){
      return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent
        ),
        onPressed: () {
          //move to new creen
          Navigator.push(context,
              RouteUtil.routeSlideTransition(nextPage, false)
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(header, style: TextStyle(fontWeight: FontWeight.bold),), SizedBox(width: 10,),
          const Icon(Icons.arrow_forward_rounded)
          ],
        )
        
      ),
    );
  }//ef
}//ec