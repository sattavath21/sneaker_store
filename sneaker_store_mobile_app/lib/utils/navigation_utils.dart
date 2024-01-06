// import 'package:flutter/material.dart';
// import 'package:mid_exam_doc_management/screens/app_navigation.dart';

// // Function to get current section, check using ModalRoute.of() fucntion
// DrawerSections getCurrentSection(BuildContext context) {
//   final route = ModalRoute.of(context);
//   if (route?.settings.name == null) return DrawerSections.home;
//   switch (route!.settings.name) {
//     case '/create_form':
//       return DrawerSections.create_form;
//     case '/draft_preview':
//       return DrawerSections.draft_preview;
//     case '/approval':
//       return DrawerSections.approval;
//     case '/account':
//       return DrawerSections.account;
//     default:
//       return DrawerSections.home;
//   }
// } //ef

// // Function for changing page with slide up animation
// void navigateToPage(BuildContext context, DrawerSections section) {
//   Navigator.pop(context);
//   Navigator.push(
//     context,
//     PageRouteBuilder(
//       // Builder for transition

//       // Which page to go
//       pageBuilder: (context, animation, secondaryAnimation) {
//         switch (section) {
//           case DrawerSections.home:
//             return HomePage();
//           case DrawerSections.draft_preview:
//             return const DraftPreviewPage();
//           case DrawerSections.approval:
//             return const ApprovalPage();
//           case DrawerSections.account:
//             return const ProfilePage();
//           default:
//             return HomePage();
//         }
//       },

//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(-1.0, 0.0); // Slide from left to right
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         // use SlideTransition as changing page animation
//         return SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         );
//       },
//     ),
//   );
// } //ef

// // For constant name
// enum DrawerSections {
//   home,
//   create_form,
//   draft_preview,
//   approval,
//   account,
// }
