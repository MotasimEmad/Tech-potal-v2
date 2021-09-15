import 'package:flutter/material.dart';
import 'package:teacher/models/pending_approval_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PendingApproval extends StatefulWidget {
  final String userId;
  const PendingApproval(this.userId);

  @override
  _PendingApprovalState createState() => _PendingApprovalState();
}

class _PendingApprovalState extends State<PendingApproval> {
  bool _loading;
  String id;
  String approval;
  List<PendingApprovalModel> pendingApprovalList = [];
  Map getComingEventsMap;
  getpendingApprovalFunction() async {
    var urlGetCurrentEvents =
        Uri.parse("http://localhost:8000/api/pending_exams/${widget.userId}");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getComingEventsMap = jsonDecode(response.body);
      if (getComingEventsMap['error'] == false) {
        getComingEventsMap['pendingExams'].forEach(
          (element) {
            if (element['ExamID'] != null) {
              PendingApprovalModel currentEventsModel = PendingApprovalModel(
                examType: element['ExamType'],
                courseName: element['CourseName'],
                paperTitle: element['PaperTitle'],
                paperDate: element['PaperDate'],
                paperID: element['PaperID'],
              );
              pendingApprovalList.add(currentEventsModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  Future updatePanding(String idEx) async {
    var url = Uri.parse("http://localhost:8000/api/update/$idEx");
    var response = await http.put(url, body: {
      "IsExaminerApproved": "1",
    });
    var res = jsonDecode(response.body);

    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update success')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error update')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getpendingApprovalFunction();
    _loading = true;
    // print(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(color: Colors.blueGrey[700]),
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
                              text: "${pendingApprovalList[index].paperDate}",
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
                              updatePanding(pendingApprovalList[index]
                                  .paperID
                                  .toString());
                              //  print(id);
                            },
                            child: Text(
                              "Approve",
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
          );
  }
}
