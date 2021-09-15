import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../main_drawer.dart';
import 'libraray_publications.dart';
import 'library_book.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "Library",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Search For:",
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(width: 10),
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
                            "Publications",
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
                            "Books",
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
              SizedBox(height: 10.0),
              if (selectedPage == 0) LibrarayPublications(),
              if (selectedPage == 1) LibraryBook(),
            ],
          ),
        ),
      ),
    );
  }
}
