//===> class: LogoutDialog
import 'package:flutter/material.dart';

class LogoutDialog extends AlertDialog {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.warning_rounded),
      iconPadding: EdgeInsets.all(8),
      iconColor: Colors.black,
      title: Text("Alert"),
      titlePadding: EdgeInsets.all(8),
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      content: 
      Text("Are you sure to logout from the app?"),
      contentTextStyle: TextStyle(fontSize: 14),

      actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Logout'),
              child: const Text('Logout', style: TextStyle(color: Colors.red),),
            ),
          
      ],
      actionsPadding: EdgeInsets.all(8),
      actionsAlignment: MainAxisAlignment.center,
      
    );
  } //ef
}//ec