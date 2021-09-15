import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teacher/models/book_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teacher/models/faculty_model.dart';

class LibraryBook extends StatefulWidget {
  @override
  _LibraryBookState createState() => _LibraryBookState();
}

class _LibraryBookState extends State<LibraryBook> {
  var fac;
  var pro;
  var spa;
  var bat;
  TextEditingController bookTitleController = TextEditingController();
  TextEditingController bookAuthorsController = TextEditingController();
  TextEditingController bookYearController = TextEditingController();

  List<BookhModel> bookList = [];
  Map getEventsSearchMap;
  getSearchFunction(var name1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/get_book_by_name/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchAuthors(var authors1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/get_book_by_authors/$authors1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFaculty(var fac1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/get_book_by_faculty/$fac1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchYear(var year) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/get_book_by_year/$year");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByAll(var name1, var authors1, var fac1, var year) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_all/$name1/$authors1/$fac1/$year");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByNameAuthor(var name1, var authors1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_name_authors/$name1/$authors1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByNameFaculty(var name1, var fac1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_name_faculty/$name1/$fac1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByNameYear(var name1, var year) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_name_year/$name1/$year");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByAuthorFaculty(var authors1, var fac1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_authors_faculty/$authors1/$fac1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByAuthorYear(var authors1, var year) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_authors_year/$authors1/$year");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchByFacultyYear(var fac1, var year) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/get_book_by_faculty_year/$fac1/$year");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['books'].forEach(
          (element) {
            if (element['Book_Id'] != null) {
              BookhModel facultyModel = BookhModel(
                bookID: element['Book_Id'],
                bookTitle: element['Title'],
                bookAuthors: element['Authors'],
                bookYear: element['Publisher_Date'],
              );
              bookList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ////////////////////////////////////////////////////////////////////////
  ///
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

  DateTime pickedDate;
  var newDate;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(height: 5.0),
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
            SizedBox(height: 5.0),
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
            SizedBox(height: 5.0),
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

                        if (bookAuthorsController.text.isNotEmpty &&
                            bookTitleController.text.isEmpty &&
                            fac == null &&
                            bookYearController.text.isEmpty)
                          getSearchAuthors(bookAuthorsController.text);

                        if (bookAuthorsController.text.isEmpty &&
                            bookTitleController.text.isEmpty &&
                            fac != null &&
                            bookYearController.text.isEmpty)
                          getSearchFaculty(fac);

                        if (bookAuthorsController.text.isEmpty &&
                            bookTitleController.text.isEmpty &&
                            fac == null &&
                            bookYearController.text.isNotEmpty)
                          getSearchYear(bookYearController.text);

                        if (bookAuthorsController.text.isNotEmpty &&
                            bookTitleController.text.isNotEmpty &&
                            fac != null &&
                            bookYearController.text.isNotEmpty)
                          getSearchByAll(
                              bookTitleController.text,
                              bookAuthorsController.text,
                              fac,
                              bookYearController.text);

                        if (bookAuthorsController.text.isNotEmpty &&
                            bookTitleController.text.isNotEmpty &&
                            fac == null &&
                            bookYearController.text.isEmpty)
                          getSearchByNameAuthor(bookTitleController.text,
                              bookAuthorsController.text);

                        if (bookAuthorsController.text.isEmpty &&
                            bookTitleController.text.isNotEmpty &&
                            fac != null &&
                            bookYearController.text.isEmpty)
                          getSearchByNameFaculty(bookTitleController.text, fac);

                        if (bookAuthorsController.text.isEmpty &&
                            bookTitleController.text.isNotEmpty &&
                            fac == null &&
                            bookYearController.text.isNotEmpty)
                          getSearchByNameYear(bookTitleController.text,
                              bookYearController.text);

                        if (bookAuthorsController.text.isNotEmpty &&
                            bookTitleController.text.isEmpty &&
                            fac != null &&
                            bookYearController.text.isEmpty)
                          getSearchByAuthorFaculty(
                              bookAuthorsController.text, fac);

                        if (bookAuthorsController.text.isNotEmpty &&
                            bookTitleController.text.isEmpty &&
                            fac == null &&
                            bookYearController.text.isNotEmpty)
                          getSearchByAuthorYear(bookAuthorsController.text,
                              bookYearController.text);

                        if (bookAuthorsController.text.isNotEmpty &&
                            bookTitleController.text.isEmpty &&
                            fac == null &&
                            bookYearController.text.isNotEmpty)
                          getSearchByFacultyYear(fac, bookYearController.text);
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
                        Row(
                          children: [
                            Text("Authors: "),
                            SizedBox(width: 5.0),
                            Text(bookList[index].bookAuthors.toString()),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text("Publish Year: "),
                            SizedBox(width: 5.0),
                            Text(bookList[index].bookYear.toString()),
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
