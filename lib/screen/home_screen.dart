import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:teacher/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _typeName = '';
  final List<String> _type = [
    'Info',
    'Important',
    'Complete',
    'Warning',
    'Danger'
  ];

  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  final CalendarController _controller = CalendarController();
  final List<Appointment> appointments = <Appointment>[];
  String event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Teacher Portal",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Event"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[700],
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Color(0xFF737373),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          // controller: _controllerEvent,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.event,
                              color: Colors.blueGrey[700],
                            ),
                            // border: InputBorder.none,
                            hintText: "Event name",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                          onChanged: (value) {
                            event = value;
                          },
                        ),
                        SizedBox(height: 10.0),
                        DropdownButtonFormField(
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconEnabledColor: Colors.blueGrey[700],
                          items: _type.map((String type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Select type of event',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                _typeName = value.toString();
                                if (value == 'Info') {
                                  //   _eventColor = Color(0xFF0007eff);
                                } else if (value == 'Important') {
                                  // _eventColor = Color(0xFF0937c5d);
                                } else if (value == 'Complete') {
                                  //_eventColor = Color(0xff7c94b6);
                                } else if (value == 'Warning') {
                                  //_eventColor = Color(0xFF0f7ed53);
                                } else {
                                  // _eventColor = Color(0xFFD32F2F);
                                }
                              },
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            "Select Start & End date of event",
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
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
                                      "Start Date",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
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
                                  color: Colors.blueGrey[700],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: FlatButton(
                                  child: Center(
                                    child: Text(
                                      "End Date",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            "Select Start & End time of event",
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
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
                                      "Start Time",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
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
                                  color: Colors.blueGrey[700],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: FlatButton(
                                  child: Center(
                                    child: Text(
                                      "End Time",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          margin: EdgeInsets.only(right: 20.0, left: 20.0),
                          height: 40,
                          child: FlatButton(
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.blueGrey[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          margin: EdgeInsets.only(right: 20.0, left: 20.0),
                          height: 40,
                          child: FlatButton(
                            child: Center(
                              child: Text(
                                "Cancle",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.red[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Good Morning Teacher",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Today you have 9 new application.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Text(
                "Events",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SfCalendar(
                todayHighlightColor: Colors.blueGrey[700],
                view: CalendarView.week,
                firstDayOfWeek: 6,
                allowedViews: [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.month,
                ],
                controller: _controller,
                initialDisplayDate: DateTime.now(),
                dataSource: getCalendarDataSource(),
                onTap: calendarTapped,
                monthViewSettings: MonthViewSettings(
                    navigationDirection: MonthNavigationDirection.vertical),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (_controller.view == CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _controller.view = CalendarView.day;
    } else if ((_controller.view == CalendarView.week ||
            _controller.view == CalendarView.workWeek) &&
        calendarTapDetails.targetElement == CalendarElement.viewHeader) {
      _controller.view = CalendarView.day;
    }
  }

  _DataSource getCalendarDataSource() {
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}
