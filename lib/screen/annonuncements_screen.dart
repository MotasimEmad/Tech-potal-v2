import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher/models/annonuncement_model.dart';
import '../main_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnnonuncementsScreen extends StatefulWidget {
  @override
  _AnnonuncementsScreenState createState() => _AnnonuncementsScreenState();
}

class _AnnonuncementsScreenState extends State<AnnonuncementsScreen> {
  DateTime pickedDate;
  var newDate;

  TextEditingController _dateFrom = TextEditingController();
  TextEditingController _dateTo = TextEditingController();
  bool _loading;
  List<AnnonuncementModel> annonuncementList = [];
  Map getEventsMap;
  getAnnouncementsFunction(var dateFrom, var dateTo) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/announcements/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['announcements'].forEach(
          (element) {
            if (element['AnnouncementId'] != null) {
              AnnonuncementModel annonuncementModel = AnnonuncementModel(
                announcementId: element['AnnouncementId'],
                announcementTitle: element['AnnouncementTitle'],
                announcementDate: element['AnnouncementDate'],
                announcementType: element['AnnouncementType'],
                facultyName: element['FacultyName'],
                specializationName: element['SpecializationName'],
                studentCount: element['StudentCount'],
              );
              annonuncementList.add(annonuncementModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "Annonuncements",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: _loading ? Center(
                  child: Text("There is no data yet ...!"),
                ) : ListView.builder(
                  itemCount: annonuncementList.length,
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
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${annonuncementList[index].announcementDate}",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  Text(
                                    "${annonuncementList[index].facultyNo}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${annonuncementList[index].announcementTitle}",
                                    style: TextStyle(
                                      color: Colors.blueGrey[700],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    controller: _dateFrom,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.blueGrey[700],
                      ),
                      labelText: "Date From",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        newDate = new DateTime(pickedDate.year,
                            pickedDate.month + 1, pickedDate.day);

                        String formattedDateEnd =
                            DateFormat('yyyy-MM-dd').format(newDate);

                        setState(() {
                          _dateFrom.text = formattedDate;
                          _dateTo.text = formattedDateEnd;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    readOnly: true,
                    controller: _dateTo,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.blueGrey[700],
                      ),
                      labelText: "Date To",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onTap: () async {
                      DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: newDate,
                        //  lastDate: DateTime.parse(_dateTimeStart).add();
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 180.0,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FlatButton(
                            child: Center(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              getAnnouncementsFunction(
                                  _dateFrom.text, _dateTo.text);
                            },
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 180.0,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FlatButton(
                            child: Center(
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
