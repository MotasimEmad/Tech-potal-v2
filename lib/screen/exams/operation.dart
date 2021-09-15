import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher/models/pending_approval_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teacher/models/years_model.dart';

class Operation extends StatefulWidget {
  final String userId;
  const Operation(this.userId);
  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  DateTime pickedDate = DateTime.now();
  DateTime pickedDate2;
  String formattedDate;
  String formattedDate2;
  bool _loading;

  List<PendingApprovalModel> pendingApprovalList = [];
  Map getComingEventsMap;
  getpendingApprovalFunction() async {
    var urlGetCurrentEvents = Uri.parse("http://localhost:8000/api/operations");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getComingEventsMap = jsonDecode(response.body);
      if (getComingEventsMap['error'] == false) {
        getComingEventsMap['operations'].forEach(
          (element) {
            if (element['ExamID'] != null) {
              PendingApprovalModel currentEventsModel = PendingApprovalModel(
                examType: element['ExamType'],
                courseName: element['CourseName'],
                paperTitle: element['PaperTitle'],
                paperDate: element['PaperDate'],
                essayExamFile: element['EssayExamFile'],
              );
              pendingApprovalList.add(currentEventsModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  List<YearsModel> yearsList = [];
  Map getYearsMap;
  getYearsFunction() async {
    var urlGetCurrentEvents = Uri.parse("http://localhost:8000/api/get_years");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getComingEventsMap = jsonDecode(response.body);
      if (getComingEventsMap['error'] == false) {
        getComingEventsMap['years'].forEach(
          (element) {
            if (element['YearId'] != null) {
              YearsModel currentEventsModel = YearsModel(
                yearName: element['YearName'],
                beginYear: element['BeginYear'],
                endYear: element['EndYear'],
              );
              yearsList.add(currentEventsModel);
            }
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getYearsFunction();
    getpendingApprovalFunction();
    _loading = true;
    formattedDate = DateFormat('yyyy').format(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Academic Year:",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 100,
              height: 50,
              child: DropdownButtonFormField(
                icon: Icon(Icons.arrow_drop_down_circle),
                iconEnabledColor: Colors.blueGrey[700],
                items: yearsList.map((item) {
                  return new DropdownMenuItem(
                    child: Column(
                      children: [
                        Text(item.beginYear),
                        Divider(),
                      ],
                    ),
                    value: item.beginYear,
                  );
                }).toList(),
                decoration: InputDecoration(
                  fillColor: Colors.blueGrey[700],
                  labelText: "$formattedDate",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      // pickedDate2 = DateTime(pickedDate.year + 1);
                      // formattedDate2 = DateFormat('yyyy').format(pickedDate2);

                      // print("Begin: $formattedDate");
                      // print("End: $formattedDate2");

                      // getpendingApprovalFunction(widget.userId, formattedDate, formattedDate2);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.blueGrey[700],
                ),
              )
            : ListView.builder(
                itemCount: pendingApprovalList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Type: ${pendingApprovalList[index].examType}",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          RichText(
                            text: TextSpan(
                              text: "Exam Date: ",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "${pendingApprovalList[index].paperDate}",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "${pendingApprovalList[index].paperTitle}",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontSize: 15,
                            ),
                          ),
                          Divider(),
                          Text(
                            "${pendingApprovalList[index].courseName}",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              GestureDetector(
                                onTap: () {
                                  if (pendingApprovalList[index].examType ==
                                      'pdf') print("pdf");

                                  if (pendingApprovalList[index].examType ==
                                      'MCQ') print("MCQ");
                                },
                                child: Text(
                                  "Preview",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.w700,
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
