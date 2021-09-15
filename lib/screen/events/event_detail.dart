import 'package:flutter/material.dart';

class EventDetail extends StatefulWidget {
  final String newsAndEventsId;
  final String newsAndEventsName;
  final String dateFrom;
  final String facultyNo;
  final String newsAndEventsDescription;
  final String newsAndEventsTimeFrom;
  final String newsAndEventsTimeTo;
  final String dateTo;
  final String facultyBatchNo;

  EventDetail({
    this.newsAndEventsId,
    this.newsAndEventsName,
    this.dateFrom,
    this.facultyNo,
    this.newsAndEventsDescription,
    this.newsAndEventsTimeTo,
    this.newsAndEventsTimeFrom,
    this.dateTo,
    this.facultyBatchNo,
  });
  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.newsAndEventsName}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: double.infinity,
              height: 500.0,
              child: Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date from: ${widget.dateFrom}  To:  ${widget.dateTo}",
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Start at: ${widget.newsAndEventsTimeFrom} until : ${widget.newsAndEventsTimeTo}",
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${widget.newsAndEventsName}",
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      Text(
                        "${widget.newsAndEventsDescription}",
                        style:
                            TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "${widget.facultyBatchNo}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: MaterialButton(  
                height: 50,
                onPressed: () {},
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Align(
                  child: Text(
                    "View more pics",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
