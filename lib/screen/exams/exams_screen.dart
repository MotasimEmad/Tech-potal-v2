import 'package:flutter/material.dart';
import 'package:teacher/models/pending_approval_model.dart';
import 'package:teacher/screen/exams/course_exams_history_fragment.dart';
import 'package:teacher/screen/exams/pending_approval.dart';
import 'package:teacher/screen/exams/related_exams.dart';
import '../../main_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamsScreen extends StatefulWidget {
  final String userEmail;
  const ExamsScreen(this.userEmail);

  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Exams"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                              "Pending Approvals",
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
                              "Related Exams",
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
                              "Course Exams History",
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
              ),
              SizedBox(height: 10),
              if (selectedPage == 0) PendingApproval(widget.userEmail),
              if (selectedPage == 1) RelatedExams(widget.userEmail),
              if (selectedPage == 2) CourseExamsHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
