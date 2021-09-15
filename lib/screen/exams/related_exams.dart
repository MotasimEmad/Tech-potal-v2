import 'package:flutter/material.dart';
import 'package:teacher/screen/exams/mcq.dart';
import 'package:teacher/screen/exams/operation.dart';

class RelatedExams extends StatefulWidget {
  final String userId;
  const RelatedExams(this.userId);
  @override
  _RelatedExamsState createState() => _RelatedExamsState();
}

class _RelatedExamsState extends State<RelatedExams> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            "Operation",
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
                            "MCQ Paper Results",
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
                ],
              ),
            ),
            if (selectedPage == 0) Operation(widget.userId),
            if (selectedPage == 1) MCQ(widget.userId),
          ],
        ),
      ),
    );
  }
}
