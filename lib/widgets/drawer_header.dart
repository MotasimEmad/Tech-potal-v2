import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/screen/auth/profile_screen.dart';
import 'package:teacher/screen/annonuncements_screen.dart';
import 'package:teacher/screen/events/events_screen.dart';
import 'package:teacher/screen/exams/exams_screen.dart';
import 'package:teacher/screen/home_screen.dart';
import 'package:teacher/screen/lecturer_screen.dart';
import 'package:teacher/screen/library/library_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum DrawerSections {
  dashboard,
  events,
  annonuncements,
  exams,
  library,
  lecturer,
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  _StateMyHeaderDrawer createState() => _StateMyHeaderDrawer();
}

class _StateMyHeaderDrawer extends State<MyHeaderDrawer> {
  var currentPage = 0;

  var userEmail;
  Map getEventsMap;
  var userId;
  readUser() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('user');
    if (userEmail != null) {
      setState(() {
        userEmail = prefs.getString('user');
        getEventsFunction();
      });
    }
  }

  getEventsFunction() async {
    var urlGetCurrentEvents =
        Uri.parse("http://localhost:8000/api/get_user_data/$userEmail");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['instructor'].forEach(
          (element) {
            if (element['InstructorId'] != null) {
              userId = element['InstructorId'];
            }
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey[700],
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/main.jpg'),
                  ),
                ),
              ),
              Text(
                "Tech name",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "$userEmail",
                style: TextStyle(
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 15,
          ),
          child: Column(
            // shows the list of menu drawer

            children: [
              _drawerItem(
                0,
                "Dashboard",
                Icons.dashboard_outlined,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
              _drawerItem(
                1,
                "News & Event",
                Icons.event,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventsScreen(),
                    ),
                  );
                },
              ),
              _drawerItem(
                2,
                "Annonuncements",
                Icons.announcement,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnnonuncementsScreen(),
                    ),
                  );
                },
              ),
              _drawerItem(3, "Exams", Icons.task, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamsScreen(userId),
                  ),
                );
              }),
              _drawerItem(4, "Library", Icons.library_add, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibraryScreen(),
                  ),
                );
              }),
              _drawerItem(5, "Moodle", Icons.computer, () {}),
              _drawerItem(5, "Staff Directory", Icons.person, () {}),
              Divider(),
              _drawerItem(5, "Profile", Icons.person, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(userEmail),
                  ),
                );
              }),
            ],
          ),
        )
      ],
    );
  }

  Container _drawerItem(
      int selectedPage, String title, IconData icon, Function function) {
    return Container(
      color:
          currentPage == selectedPage ? Colors.grey[200] : Colors.transparent,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: Colors.blueGrey[700],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
