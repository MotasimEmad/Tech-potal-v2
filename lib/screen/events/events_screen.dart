import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:teacher/models/events_model.dart';
import 'package:http/http.dart' as http;
import 'package:teacher/screen/events/coming_event.dart';
import 'package:teacher/screen/events/current_event.dart';
import 'package:teacher/screen/events/serach_event.dart';
import 'package:teacher/shared/shared_auth.dart';
import 'dart:convert';

import '../../main_drawer.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  SharedAuth sharedAuth = new SharedAuth();
  int selectedPage = 0;
  var tt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("News & Events"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPage = 0;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Events",
                            style: TextStyle(
                              color: selectedPage == 0
                                  ? Colors.blueGrey[700]
                                  : Colors.grey,
                              fontWeight: selectedPage == 0
                                  ? FontWeight.bold
                                  : FontWeight.w200,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 2,
                            width: 30,
                            color: selectedPage == 0
                                ? Colors.blueGrey[700]
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPage = 1;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Coming Events",
                            style: TextStyle(
                              color: selectedPage == 1
                                  ? Colors.blueGrey[700]
                                  : Colors.grey,
                              fontWeight: selectedPage == 1
                                  ? FontWeight.bold
                                  : FontWeight.w200,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 2,
                            width: 30,
                            color: selectedPage == 1
                                ? Colors.blueGrey[700]
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPage = 2;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Search",
                            style: TextStyle(
                              color: selectedPage == 2
                                  ? Colors.blueGrey[700]
                                  : Colors.grey,
                              fontWeight: selectedPage == 2
                                  ? FontWeight.bold
                                  : FontWeight.w200,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 2,
                            width: 30,
                            color: selectedPage == 2
                                ? Colors.blueGrey[700]
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //  SizedBox(height: 10),
              if (selectedPage == 0) CurrentEvent(),
              if (selectedPage == 1) ComingEvent(),

              if (selectedPage == 2) SearchEvent(),
            ],
          ),
        ),
      ),
    );
  }
}
