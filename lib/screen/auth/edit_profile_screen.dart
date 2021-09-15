import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/screen/auth/edit_profile_screen.dart';

class EditProfile extends StatefulWidget {
  final String user_id;
  EditProfile(this.user_id);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _passwordController = TextEditingController();
  Future updateUserData(String password) async {
    var url = Uri.parse(
        "http://localhost:8000/api/update_user_data/${widget.user_id}");
    var response = await http.put(url, body: {
      "Password": password,
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

  var userId;
  var userName;
  var userEmail;
  var userPassword;

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
              userName = element['NameEN'];
              userEmail = element['Email'];
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
          "Edit Profile",
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
                Padding(
                  padding: EdgeInsets.only(bottom: 35.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                        onPressed: () {},
                      ),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: "New Password",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    updateUserData(_passwordController.text);
                  },
                  padding: EdgeInsets.all(20),
                  color: Colors.blueGrey[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                    child: Text(
                      "Change Password",
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
