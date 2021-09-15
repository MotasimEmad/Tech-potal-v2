import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher/screen/events/events_screen.dart';

import 'package:teacher/shared/shared_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  saveUser(String userEmail) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', userEmail);
  }

  readUser() async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('user') ?? 0;

    if (value != null) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventsScreen(),
        ),
      );
    }
  }

  SharedAuth sharedAuth = new SharedAuth();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _loading;
  Future login(String email, String password) async {
    var url = Uri.parse("http://localhost:8000/api/user/login");
    var response = await http.post(url, body: {
      "Email": email,
      "Password": password,
    });

    if (response.statusCode == 200) {
      saveUser(email);
      readUser();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventsScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email or password is wrong')),
      );
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    child: Text("Instrctor Portal", style: TextStyle(color: Colors.grey[800], fontSize: 20)),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      style: TextStyle(color: Colors.grey[700]),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      style: TextStyle(color: Colors.grey[700]),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  MaterialButton(
                    onPressed: () async {
                      login(_emailController.text, _passwordController.text);
                      setState(() {
                        _loading = true;
                      });
                    },
                    padding: EdgeInsets.all(20),
                    color: Colors.blueGrey[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                      child: _loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
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
      ),
    );
  }
}
