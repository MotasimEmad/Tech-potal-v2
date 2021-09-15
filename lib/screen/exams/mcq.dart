import 'package:flutter/material.dart';
import 'package:teacher/models/pending_approval_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MCQ extends StatefulWidget {
  final String userId;
  const MCQ(this.userId);
  @override
  _MCQState createState() => _MCQState();
}

class _MCQState extends State<MCQ> {
  bool _loading;
  List<PendingApprovalModel> pendingApprovalList = [];
  Map getComingEventsMap;
  getpendingApprovalFunction() async {
    var urlGetCurrentEvents =
        Uri.parse("http://localhost:8000/api/mcq/${widget.userId}");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getComingEventsMap = jsonDecode(response.body);
      if (getComingEventsMap['error'] == false) {
        getComingEventsMap['mcq'].forEach(
          (element) {
            if (element['ExamID'] != null) {
              PendingApprovalModel currentEventsModel = PendingApprovalModel(
                examType: element['ExamType'],
                courseName: element['CourseName'],
                paperTitle: element['PaperTitle'],
                paperDate: element['PaperDate'],
              );
              pendingApprovalList.add(currentEventsModel);
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
    getpendingApprovalFunction();
    _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
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
              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {},
                  child: MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(20),
                    color: Colors.blueGrey[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                      child: Text(
                        "2020 / 2021",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                                Text(
                                  "Result",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Statistics",
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
      ),
    );
  }
}
