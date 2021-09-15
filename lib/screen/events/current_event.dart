import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/models/events_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teacher/shared/shared_auth.dart';

class CurrentEvent extends StatefulWidget {
  @override
  _CurrentEventState createState() => _CurrentEventState();
}

class _CurrentEventState extends State<CurrentEvent> {
  SharedAuth sharedAuth = new SharedAuth();

  var tt;
  bool _loading;
  List<EventsModel> currentEventsList = [];
  Map getEventsMap;
  getEventsFunction() async {
    var urlGetCurrentEvents =
        Uri.parse("http://localhost:8000/api/current_events");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              EventsModel currentEventsModel = EventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              currentEventsList.add(currentEventsModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getEventsFunction();
    _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: Text(
            "Current Events",
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
        ),
        _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey[700],
                ),
              )
            : ListView.builder(
                itemCount: currentEventsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.all(5),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.asset(
                                "assets/images/main.jpg",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "${currentEventsList[index].newsAndEventsName}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${currentEventsList[index].dateFrom}",
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                Text(
                                  "${currentEventsList[index].facultyNo}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonBar(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 6, sigmaY: 6),
                                        child: AlertDialog(
                                          title: Text(
                                            "${currentEventsList[index].newsAndEventsName}",
                                            style: TextStyle(
                                                color: Colors.blueGrey[700],
                                                fontSize: 15),
                                          ),
                                          content: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/main.jpg",
                                                  height: 120,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(height: 5.0),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "From at ${currentEventsList[index].dateFrom} To ${currentEventsList[index].dateTo}",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                    SizedBox(width: 5.0),
                                                    Text(
                                                      "Start at ${currentEventsList[index].newsAndEventsTimeFrom} To ${currentEventsList[index].newsAndEventsTimeTo}",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.0),
                                                Text(
                                                  "${currentEventsList[index].newsAndEventsDescription}",
                                                  style: TextStyle(
                                                      color: Colors.grey[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Close",
                                                style: TextStyle(
                                                  color: Colors.blueGrey[700],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Details",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
