import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_store_mobile_app/utils/route_util.dart';

class ProfileListTile extends StatelessWidget {
  final IconData iconData;
  final String name;
  final String subtitle;
  final Widget nextPage;

  const ProfileListTile(
      {super.key,
      required this.iconData,
      required this.name,
      required this.subtitle,
      required this.nextPage});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (nextPage is AlertDialog) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => nextPage,
          );
        } else {

          Navigator.of(context).push(RouteUtil.routeSlideTransition(nextPage, true));

        }
      },
      splashColor: Colors.black12, // Change splashColor to the desired color

      child: ListTile(
        leading: SizedBox(
          width: 50,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              iconData,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        subtitle: Column(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(name.tr(),
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(subtitle.tr(),
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ),
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right_rounded, color: name.toLowerCase() != "log out" ?
        Colors.black87 : Colors.white,),
      ),
    );
  }
}
