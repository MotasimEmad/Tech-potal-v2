import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/screen/auth/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String user_id;
  ProfileScreen(this.user_id);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userId;
  var userName;
  var userEmail;
  var userPassword;
  var userPhone;

  Map getEventsMap;

  getEventsFunction() async {
    var urlGetCurrentEvents =
        Uri.parse("http://localhost:8000/api/get_user_data/${widget.user_id}");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['instructor'].forEach(
          (element) {
            if (element['InstructorId'] != null) {
              userId = element['InstructorId'];
              userName = element['NameEN'];
              userEmail = element['Email'];
              userPhone = element['Phone'];
              userPassword = element['Password'];
            }
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getEventsFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/main.jpg"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                _CreateTextField('Name', userName),
                _CreateTextField('Email', userEmail),
                _CreateTextField('Phone', userPhone),
                _CreateTextField('Password', userPassword),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(userId),
                      ),
                    );
                  },
                  padding: EdgeInsets.all(20),
                  color: Colors.blueGrey[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding _CreateTextField(String label, String hint) {
  var _Padding = Padding(
    padding: EdgeInsets.only(bottom: 35.0),
    child: TextField(
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye, color: Colors.grey),
            onPressed: () {}),
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    ),
  );
  return _Padding;
}
