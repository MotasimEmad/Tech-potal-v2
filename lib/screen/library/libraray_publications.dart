import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teacher/models/book_model.dart';
import 'package:teacher/models/faculty_model.dart';

class LibrarayPublications extends StatefulWidget {
  @override
  _LibrarayPublicationsState createState() => _LibrarayPublicationsState();
}

class _LibrarayPublicationsState extends State<LibrarayPublications> {
  TextEditingController bookTitleController = TextEditingController();
  TextEditingController bookAuthorsController = TextEditingController();
  TextEditingController bookYearController = TextEditingController();
  int radioValue = 1;
  var fac;

  List<BookhModel> bookList = [];
  Map getEventsSearchMap;
  getSearchFunction(var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_name_publications/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Pubid'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Pubid'],
                bookTitle: element['Tittle'],
                bookAuthors: element['Authors'],
                bookYear: element['Year'],
                bookAbstract: element['Abstract'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchAuthors(var authors1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_authors_publications/$authors1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Pubid'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Pubid'],
                bookTitle: element['Tittle'],
                bookAuthors: element['Authors'],
                bookYear: element['YearNo'],
                bookAbstract: element['Abstract'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFaculty(var fac1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_faculty_publications/$fac1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Pubid'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Pubid'],
                bookTitle: element['Tittle'],
                bookAuthors: element['Authors'],
                bookYear: element['YearNo'],
                bookAbstract: element['Abstract'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchYear(var year) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_year_publications/$year");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Pubid'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Pubid'],
                bookTitle: element['Tittle'],
                bookAuthors: element['Authors'],
                bookYear: element['YearNo'],
                bookAbstract: element['Abstract'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  //////////////////////////////////////////////////////////////////////

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

  @override
  void initState() {
    super.initState();
    getAnnouncementsFunction();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
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
                  "Title",
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
                  "Faculty",
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
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
                  "Institute Author",
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 4,
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
                  "Publish Year",
                ),
              ],
            ),
            SizedBox(height: 5.0),
            if (radioValue == 1)
              TextFormField(
                controller: bookTitleController,
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Book Title",
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
            if (radioValue == 2)
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
            if (radioValue == 3)
              TextFormField(
                controller: bookAuthorsController,
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Author's",
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
            if (radioValue == 4)
              TextFormField(
                controller: bookYearController,
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Publish Year",
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
                        bookList.clear();
                        if (bookTitleController.text.isNotEmpty &&
                            bookAuthorsController.text.isEmpty &&
                            fac == null &&
                            bookYearController.text.isEmpty)
                          getSearchFunction(bookTitleController.text);

                        if (bookTitleController.text.isEmpty &&
                            bookAuthorsController.text.isEmpty &&
                            fac != null &&
                            bookYearController.text.isEmpty)
                          getSearchFaculty(fac);

                        if (bookTitleController.text.isEmpty &&
                            bookAuthorsController.text.isNotEmpty &&
                            fac == null &&
                            bookYearController.text.isEmpty)
                          getSearchAuthors(bookAuthorsController.text);

                        if (bookTitleController.text.isEmpty &&
                            bookAuthorsController.text.isEmpty &&
                            fac == null &&
                            bookYearController.text.isNotEmpty)
                          getSearchYear(bookYearController.text);
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
                      onPressed: () {
                        //    _eventName.clear();
                      },
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: bookList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title: "),
                              SizedBox(width: 5.0),
                              Text(bookList[index].bookTitle.toString()),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text("Authors: "),
                              SizedBox(width: 5.0),
                              Text(bookList[index].bookAuthors.toString()),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text("Publish Year: "),
                            SizedBox(width: 5.0),
                            Text(bookList[index].bookYear.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(""),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 6, sigmaY: 6),
                                      child: AlertDialog(
                                        title: Column(
                                          children: [
                                            Text(
                                              "${bookList[index].bookTitle}",
                                              style: TextStyle(
                                                  color: Colors.blueGrey[700],
                                                  fontSize: 15),
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Text(
                                            "${bookList[index].bookAbstract}",
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Close",
                                              style: TextStyle(
                                                color: Colors.blueGrey[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "View Abstract",
                                style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.w800),
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
      ),
    );
  }
}
