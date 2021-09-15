import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:teacher/models/batch_model.dart';
import 'package:teacher/models/faculty_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teacher/models/program_model.dart';
import 'package:teacher/models/specialization_model.dart';

class CourseExamsHistory extends StatefulWidget {
  @override
  _CourseExamsHistoryState createState() => _CourseExamsHistoryState();
}

class _CourseExamsHistoryState extends State<CourseExamsHistory> {
  int radioValue = 1;
  DateTime pickedDate;
  var newDate;
  var fac;
  var pro;
  var spa;
  var bat;

  TextEditingController _dateFrom = TextEditingController();
  TextEditingController _dateTo = TextEditingController();
  TextEditingController _courseTitle = TextEditingController();

  ///////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////////
  List<FacultyModel> facultyModelList = [];
  Map getEventsMap;
  getAnnouncementsFunction() async {
    // http://127.0.0.1:8000/api/search_news_and_events/$fac/$pro/$spa/$bat/
    var urlGetCurrentEvents = Uri.parse("http://127.0.0.1:8000/api/faculties");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['faculties'].forEach(
          (element) {
            if (element['FacultyId'] != null) {
              FacultyModel facultyModel = FacultyModel(
                facultyId: element['FacultyId'],
                facultyName: element['FacultyName'],
              );
              facultyModelList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  List<ProgramModel> programModelList = [];
  Map getProgramsMap;
  getProgramsFunction() async {
    var urlGetCurrentPrograms = Uri.parse("http://127.0.0.1:8000/api/programs");
    http.Response response = await http.get(urlGetCurrentPrograms);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['programs'].forEach(
          (element) {
            if (element['FacultyProgramId'] != null) {
              ProgramModel programModel = ProgramModel(
                programId: element['FacultyProgramId'],
                programNameEN: element['ProgramNameEN'],
              );
              programModelList.add(programModel);
            }
          },
        );
      }
    });
  }

  List<SpecializationsModel> specializationsModelList = [];
  Map getSpecializationMap;
  getSpecializationFunction() async {
    var urlGetCurrentPrograms =
        Uri.parse("http://127.0.0.1:8000/api/specializations");
    http.Response response = await http.get(urlGetCurrentPrograms);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['specialization'].forEach(
          (element) {
            if (element['SpecializationName'] != null) {
              SpecializationsModel specializationModel = SpecializationsModel(
                facultyProgramNo: element['FacultyProgramNo'],
                specializationName: element['SpecializationName'],
              );
              specializationsModelList.add(specializationModel);
            }
          },
        );
      }
    });
  }

  List<BatchModel> batchesModelList = [];
  Map getBatchedMap;
  getBatchesFunction() async {
    var urlGetCurrentPrograms = Uri.parse("http://127.0.0.1:8000/api/batchs");
    http.Response response = await http.get(urlGetCurrentPrograms);
    setState(() {
      getBatchedMap = jsonDecode(response.body);
      if (getBatchedMap['error'] == false) {
        getBatchedMap['batches'].forEach(
          (element) {
            if (element['FacultyBatchId'] != null) {
              BatchModel specializationModel = BatchModel(
                batchid: element['FacultyBatchId'],
                batchName: element['BatchName'],
              );
              batchesModelList.add(specializationModel);
            }
          },
        );
      }
    });
  }
  //////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    getAnnouncementsFunction();
    getBatchesFunction();
    getProgramsFunction();
    getSpecializationFunction();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  "Exams Operation's",
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle),
                iconEnabledColor: Colors.blueGrey[700],
                items: facultyModelList.map((item) {
                  return new DropdownMenuItem(
                    child: SizedBox(
                      child: new Text(item.facultyName),
                      width: 200,
                    ),
                    value: item.facultyId.toString(),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Select Faculty",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      fac = value;
                    },
                  );
                },
              ),
              SizedBox(height: 5.0),
              DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle),
                iconEnabledColor: Colors.blueGrey[700],
                items: programModelList.map((item) {
                  return new DropdownMenuItem(
                    child: new Text(item.programNameEN),
                    value: item.programId,
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Select Program",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      pro = value;
                    },
                  );
                },
              ),
              SizedBox(height: 5.0),
              DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle),
                iconEnabledColor: Colors.blueGrey[700],
                items: specializationsModelList.map((item) {
                  return new DropdownMenuItem(
                    child: SizedBox(
                      child: new Text(item.specializationName),
                      width: 200,
                    ),
                    value: item.facultyProgramNo,
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Select Specializations",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      spa = value;
                    },
                  );
                },
              ),
              SizedBox(height: 5),
              DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle),
                iconEnabledColor: Colors.blueGrey[700],
                items: batchesModelList.map((item) {
                  return new DropdownMenuItem(
                    child: SizedBox(
                      child: new Text(item.batchName),
                      width: 200,
                    ),
                    value: item.batchid,
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Select Batch",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      bat = value;
                    },
                  );
                },
              ),

              SizedBox(height: 5.0),
              TextFormField(
                //    controller: _eventName,
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Paper Title",
                  //  hintStyle: kBodyText,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Paper Type: ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: radioValue,
                          activeColor: Colors.blueGrey[700],
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Active",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: radioValue,
                          activeColor: Colors.blueGrey[700],
                          onChanged: (value) {
                            setState(() {
                              radioValue = value;
                            });
                          },
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Archieve",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
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

                    newDate = new DateTime(
                        pickedDate.year, pickedDate.month + 1, pickedDate.day);

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
              // Show Date Picker Here

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
                        onPressed: () {},
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
    );
  }
}
