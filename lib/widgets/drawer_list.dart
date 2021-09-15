// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:teacher/screen/annonuncements_screen.dart';
// import 'package:teacher/screen/events/events_screen.dart';
// import 'package:teacher/screen/exams/exams_screen.dart';
// import 'package:teacher/screen/home_screen.dart';
// import 'package:teacher/screen/lecturer_screen.dart';
// import 'package:teacher/screen/library/library_screen.dart';

// enum DrawerSections {
//   dashboard,
//   events,
//   annonuncements,
//   exams,
//   library,
//   lecturer,
// }

// class DrawerList extends StatefulWidget {
//   @override
//   _DrawerListState createState() => _DrawerListState();
// }

// class _DrawerListState extends State<DrawerList> {

//   var userEmail;
//   readUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     userEmail = prefs.getString('user');
//     if (userEmail != null) {
//       setState(() {
//         userEmail = prefs.getString('user');
//       });
//     }
//   }

//   @override
//   void initState() { 
//     super.initState();
//     readUser();
//   //  print(userEmail);
//   }

//   var currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 15,
//       ),
//       child: Column(
//         // shows the list of menu drawer

//         children: [
//           _drawerItem(
//             0,
//             "Dashboard",
//             Icons.dashboard_outlined,
//             () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomeScreen(),
//                 ),
//               );
//             },
//           ),
//           _drawerItem(
//             1,
//             "News & Event",
//             Icons.event,
//             () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EventsScreen(),
//                 ),
//               );
//             },
//           ),
//           _drawerItem(
//             2,
//             "Annonuncements",
//             Icons.announcement,
//             () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AnnonuncementsScreen(),
//                 ),
//               );
//             },
//           ),
//           _drawerItem(3, "Exams", Icons.task, () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ExamsScreen(userEmail: userEmail),
//               ),
//             );
//           }),
//           _drawerItem(4, "Library", Icons.library_add, () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LibraryScreen(),
//               ),
//             );
//           }),
//           _drawerItem(5, "Lecturer Courses Report", Icons.report, () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LecturerScreen(),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   Container _drawerItem(
//       int selectedPage, String title, IconData icon, Function function) {
//     return Container(
//       color:
//           currentPage == selectedPage ? Colors.grey[200] : Colors.transparent,
//       child: InkWell(
//         onTap: function,
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   color: Colors.blueGrey[700],
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.grey[700],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
