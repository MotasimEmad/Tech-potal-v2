import 'package:flutter/material.dart';

import '../main_drawer.dart';

class LecturerScreen extends StatefulWidget {
  @override
  _LecturerScreenState createState() => _LecturerScreenState();
}

class _LecturerScreenState extends State<LecturerScreen> {
  final List<String> _facultyList = [
    'Faculty 1',
    'Faculty 2',
    'Faculty 3',
    'Faculty 4',
    'Faculty 5'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "Lecturer Courses Report",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "Lecturer Courses Information",
                      style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    icon: Icon(Icons.arrow_drop_down_circle),
                    iconEnabledColor: Colors.blueGrey[700],
                    // items: facultyModelList.map((item) {
                    //   return new DropdownMenuItem(
                    //     child: SizedBox(
                    //       child: new Text(item.facultyName),
                    //       width: 200,
                    //     ),
                    //     value: item.facultyId.toString(),
                    //   );
                    // }).toList(),
                    decoration: InputDecoration(
                      labelText: "Select Course",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      // setState(
                      //   () {
                      //     fac = value;
                      //   },
                      // );
                    },
                  ),
                  SizedBox(height: 5.0),
                  DropdownButtonFormField(
                    icon: Icon(Icons.arrow_drop_down_circle),
                    iconEnabledColor: Colors.blueGrey[700],
                    // items: facultyModelList.map((item) {
                    //   return new DropdownMenuItem(
                    //     child: SizedBox(
                    //       child: new Text(item.facultyName),
                    //       width: 200,
                    //     ),
                    //     value: item.facultyId.toString(),
                    //   );
                    // }).toList(),
                    decoration: InputDecoration(
                      labelText: "Lecture Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      // setState(
                      //   () {
                      //     fac = value;
                      //   },
                      // );
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    readOnly: true,
                    //  controller: _dateFrom,
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
                      // pickedDate = await showDatePicker(
                      //   context: context,
                      //   initialDate: DateTime.now(),
                      //   firstDate: DateTime(2000),
                      //   lastDate: DateTime(2100),
                      // );

                      // if (pickedDate != null) {
                      //   String formattedDate =
                      //       DateFormat('yyyy-MM-dd').format(pickedDate);

                      //   newDate = new DateTime(
                      //       pickedDate.year, pickedDate.month + 1, pickedDate.day);

                      //   String formattedDateEnd =
                      //       DateFormat('yyyy-MM-dd').format(newDate);

                      //   setState(() {
                      //     _dateFrom.text = formattedDate;
                      //     _dateTo.text = formattedDateEnd;
                      //   });
                      // } else {
                      //   print("Date is not selected");
                      // }
                    },
                  ),
                  // Show Date Picker Here

                  SizedBox(height: 10.0),
                  TextFormField(
                    readOnly: true,
                    //controller: _dateTo,
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
                        // lastDate: newDate,
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
                                "View",
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
        ),
      ),
    );
  }
}
