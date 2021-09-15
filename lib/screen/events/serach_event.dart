import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teacher/models/batch_model.dart';
import 'package:teacher/models/faculty_model.dart';
import 'package:http/http.dart' as http;
import 'package:teacher/models/filter_events_model.dart';
import 'dart:convert';
import 'package:teacher/models/program_model.dart';
import 'package:teacher/models/search_list.dart';
import 'package:teacher/models/specialization_model.dart';

class SearchEvent extends StatefulWidget {
  @override
  _SearchEventState createState() => _SearchEventState();
}

class _SearchEventState extends State<SearchEvent> {
  DateTime pickedDate;
  var newDate;

  TextEditingController _dateFrom = TextEditingController();
  TextEditingController _dateTo = TextEditingController();
  TextEditingController _eventName = TextEditingController();

  var fac;
  var pro;
  var spa;
  var bat;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  List<SearchEventsModel> searchList = [];
  Map getEventsSearchMap;
  getSearchFunction(var fac1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/search_news_and_events_fac/$fac1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFunctionPro(var pro1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/search_news_and_events_pro/$pro1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFunctionSpa(var spa1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/search_news_and_events_spa/$spa1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFunctionBat(var bat1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/search_news_and_events_bat/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFunctionName(var eventName1) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/filter_event_by_name/$eventName1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getSearchFunctionDate(var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/filter_event_by_date/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  filter_events(var fac1, var pro1, var spa1, var bat1, var name1, var dateFrom,
      var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/filter_event/$fac1/$pro1/$spa1/$bat1/$name1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////
  // Faculty FUNCTIONS
  getDataFacultyProgram(var fac1, var pro1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program/$fac1/$pro1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultySpecialization(var fac1, var spa1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_specialization/$fac1/$spa1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyBatch(var fac1, var bat1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_batch/$fac1/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyName(var fac1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_name/$fac1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyDate(var fac1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_date/$fac1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramSpecialization(var fac1, var pro1, var spa1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_specialization/$fac1/$pro1/$spa1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramBatch(var fac1, var pro1, var bat1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_batch/$fac1/$pro1/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramName(var fac1, var pro1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_name/$fac1/$pro1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramDate(
      var fac1, var pro1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_date/$fac1/$pro1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramSpecializationBatch(
      var fac1, var pro1, var spa1, var bat1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_specialization_batch/$fac1/$pro1/$spa1/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramSpecializationName(
      var fac1, var pro1, var spa1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_specialization_name/$fac1/$pro1/$spa1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataFacultyProgramSpecializationDate(
      var fac1, var pro1, var spa1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_faculty_program_specialization_date/$fac1/$pro1/$spa1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////
  // Program FUNCTIONS
  getDataProgramSpecialization(var pro1, var spa1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_specialization/$pro1/$spa1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramBatch(var pro1, var bat1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_batch/$pro1/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramName(var pro1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_name/$pro1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramDate(var pro1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_date/$pro1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramSpecializationBatch(var pro1, var spa1, var bat1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_specialization_batch/$pro1/$spa1/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramSpecializationName(var pro1, var spa1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_specialization_name/$pro1/$spa1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramSpecializationDate(
      var pro1, var spa1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_specialization_date/$pro1/$spa1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramSpecializationBatchName(
      var pro1, var spa1, var bat1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_specialization_batch_name/$pro1/$spa1/$bat1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataProgramSpecializationBatchDate(
      var pro1, var spa1, var bat1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_program_specialization_batch_date/$pro1/$spa1/$bat1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////
  // Specialization FUNCTIONS
  getDataSpecializationBatch(var spa1, var bat1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_specialization_batch/$spa1/$bat1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataSpecializationName(var spa1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_specialization_name/$spa1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataSpecializationDate(var spa1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_specialization_date/$spa1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataSpecializationBatchName(var spa1, var bat1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_specialization_batch_name/$spa1/$bat1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataSpecializationBatchDate(
      var spa1, var bat1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_specialization_batch_date/$spa1/$bat1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////
  // Batch FUNCTIONS
  getDataBatchName(var bat1, var name1) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_batch_name/$bat1/$name1");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataBatchDate(var bat1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_batch_date/$bat1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  getDataBatchNameDate(var bat1, var name1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_batch_name_date/$bat1/$name1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////
  // Name FUNCTIONS
  getDataNameDate(var name1, var dateFrom, var dateTo) async {
    var urlGetCurrentEvents = Uri.parse(
        "http://127.0.0.1:8000/api/search_news_and_events_name_date/$name1/$dateFrom/$dateTo");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getEventsSearchMap = jsonDecode(response.body);
      if (getEventsSearchMap['error'] == false) {
        getEventsSearchMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              SearchEventsModel facultyModel = SearchEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              searchList.add(facultyModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

  List<ProgramModel> programModelList = [];
  Map getProgramsMap;
  getProgramsFunction() async {
    var urlGetCurrentPrograms = Uri.parse("http://127.0.0.1:8000/api/programs");
    http.Response response = await http.get(urlGetCurrentPrograms);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['programs'].forEach(
          (element) {
            if (element['FacultyProgramId'] != null) {
              ProgramModel programModel = ProgramModel(
                programId: element['FacultyProgramId'],
                programNameEN: element['ProgramNameEN'],
              );
              programModelList.add(programModel);
            }
          },
        );
      }
    });
  }

  List<SpecializationsModel> specializationsModelList = [];
  Map getSpecializationMap;
  getSpecializationFunction() async {
    var urlGetCurrentPrograms =
        Uri.parse("http://127.0.0.1:8000/api/specializations");
    http.Response response = await http.get(urlGetCurrentPrograms);
    setState(() {
      getEventsMap = jsonDecode(response.body);
      if (getEventsMap['error'] == false) {
        getEventsMap['specialization'].forEach(
          (element) {
            if (element['SpecializationName'] != null) {
              SpecializationsModel specializationModel = SpecializationsModel(
                facultyProgramNo: element['FacultyProgramNo'],
                specializationName: element['SpecializationName'],
              );
              specializationsModelList.add(specializationModel);
            }
          },
        );
      }
    });
  }

  List<BatchModel> batchesModelList = [];
  Map getBatchedMap;
  getBatchesFunction() async {
    var urlGetCurrentPrograms = Uri.parse("http://127.0.0.1:8000/api/batchs");
    http.Response response = await http.get(urlGetCurrentPrograms);
    setState(() {
      getBatchedMap = jsonDecode(response.body);
      if (getBatchedMap['error'] == false) {
        getBatchedMap['batches'].forEach(
          (element) {
            if (element['FacultyBatchId'] != null) {
              BatchModel specializationModel = BatchModel(
                batchid: element['FacultyBatchId'],
                batchName: element['BatchName'],
              );
              batchesModelList.add(specializationModel);
            }
          },
        );
      }
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  List<FilterEventsModel> filterEventsList = [];
  Map getFilterEventsMap;
  getEventsFunction(var from, var to) async {
    var urlGetCurrentEvents =
        Uri.parse("http://127.0.0.1:8000/api/filter_event/$from/$to");
    http.Response response = await http.get(urlGetCurrentEvents);
    setState(() {
      getFilterEventsMap = jsonDecode(response.body);
      if (getFilterEventsMap['error'] == false) {
        getFilterEventsMap['newsEvents'].forEach(
          (element) {
            if (element['NewsAndEventsId'] != null) {
              FilterEventsModel currentEventsModel = FilterEventsModel(
                newsAndEventsId: element['NewsAndEventsId'],
                newsAndEventsName: element['NewsAndEventsName'],
                dateFrom: element['DateFrom'],
                facultyNo: element['FacultyNo'],
              );
              filterEventsList.add(currentEventsModel);
            }
          },
        );
      }
    });
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    getAnnouncementsFunction();
    getBatchesFunction();
    getProgramsFunction();
    getSpecializationFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              "* You can search only with one thing",
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
          DropdownButtonFormField(
            icon: Icon(Icons.arrow_drop_down_circle),
            iconEnabledColor: Colors.blueGrey[700],
            items: programModelList.map((item) {
              return new DropdownMenuItem(
                child: new Text(item.programNameEN),
                value: item.programId,
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: "Select Program",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  pro = value;
                },
              );
            },
          ),
          SizedBox(height: 5.0),
          DropdownButtonFormField(
            icon: Icon(Icons.arrow_drop_down_circle),
            iconEnabledColor: Colors.blueGrey[700],
            items: specializationsModelList.map((item) {
              return new DropdownMenuItem(
                child: SizedBox(
                  child: new Text(item.specializationName),
                  width: 200,
                ),
                value: item.facultyProgramNo,
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: "Select Specializations",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  spa = value;
                },
              );
            },
          ),
          SizedBox(height: 5),
          DropdownButtonFormField(
            icon: Icon(Icons.arrow_drop_down_circle),
            iconEnabledColor: Colors.blueGrey[700],
            items: batchesModelList.map((item) {
              return new DropdownMenuItem(
                child: SizedBox(
                  child: new Text(item.batchName),
                  width: 200,
                ),
                value: item.batchid,
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: "Select Batch",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  bat = value;
                },
              );
            },
          ),
          SizedBox(height: 5.0),
          TextFormField(
            controller: _eventName,
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: "Event Name",
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
          TextFormField(
            readOnly: true,
            controller: _dateFrom,
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
              pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);

                newDate = new DateTime(
                    pickedDate.year, pickedDate.month + 1, pickedDate.day);

                String formattedDateEnd =
                    DateFormat('yyyy-MM-dd').format(newDate);

                setState(() {
                  _dateFrom.text = formattedDate;
                  _dateTo.text = formattedDateEnd;
                });
              } else {
                print("Date is not selected");
              }
            },
          ),
          // Show Date Picker Here

          SizedBox(height: 10.0),
          TextFormField(
            readOnly: true,
            controller: _dateTo,
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
                lastDate: newDate,
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
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      searchList.clear();
                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isNotEmpty)
                        filter_events(fac, pro, spa, bat, _eventName,
                            _dateFrom.text, _dateTo.text);

                      if (fac != null &&
                          pro == null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty) getSearchFunction(fac);

                      if (fac == null &&
                          pro != null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty) getSearchFunctionPro(pro);

                      if (fac == null &&
                          pro == null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty) getSearchFunctionSpa(spa);

                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty) getSearchFunctionBat(bat);

                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getSearchFunctionName(_eventName.text);

                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getSearchFunctionDate(_dateFrom.text, _dateTo.text);

                      /////////// Faculty FUNCTION ///////////////////////////////////////////////////
                      if (fac != null &&
                          pro != null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyProgram(fac, pro);

                      if (fac != null &&
                          pro == null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultySpecialization(fac, spa);

                      if (fac != null &&
                          pro == null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty) getDataFacultyBatch(fac, bat);

                      if (fac != null &&
                          pro == null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyName(fac, _eventName.text);

                      if (fac != null &&
                          pro == null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataFacultyDate(fac, _dateFrom.text, _dateTo.text);

                      if (fac != null &&
                          pro != null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyProgramSpecialization(fac, pro, spa);

                      if (fac != null &&
                          pro != null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyProgramBatch(fac, pro, bat);

                      if (fac != null &&
                          pro != null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyProgramName(fac, pro, _eventName.text);

                      if (fac != null &&
                          pro != null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataFacultyProgramDate(
                            fac, pro, _dateFrom.text, _dateTo.text);

                      if (fac != null &&
                          pro != null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyProgramSpecializationBatch(
                            fac, pro, spa, bat);

                      if (fac != null &&
                          pro != null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataFacultyProgramSpecializationName(
                            fac, pro, spa, _eventName.text);

                      if (fac != null &&
                          pro != null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataFacultyProgramSpecializationDate(
                            fac, pro, spa, _dateFrom.text, _dateTo.text);

                      /////////// Program FUNCTION ///////////////////////////////////////////////////

                      if (fac == null &&
                          pro != null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataProgramSpecialization(pro, spa);

                      if (fac == null &&
                          pro != null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty) getDataProgramBatch(pro, bat);

                      if (fac == null &&
                          pro != null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataProgramName(pro, _eventName.text);

                      if (fac == null &&
                          pro != null &&
                          spa == null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataProgramDate(pro, _dateFrom.text, _dateTo.text);

                      if (fac == null &&
                          pro != null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataProgramSpecializationBatch(pro, spa, bat);

                      if (fac == null &&
                          pro != null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataProgramSpecializationName(
                            pro, spa, _eventName.text);

                      if (fac == null &&
                          pro != null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataProgramSpecializationDate(
                            pro, spa, _dateFrom.text, _dateTo.text);

                      if (fac == null &&
                          pro != null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataProgramSpecializationBatchName(
                            pro, spa, bat, _eventName.text);

                      if (fac == null &&
                          pro != null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataProgramSpecializationBatchDate(
                            pro, spa, bat, _dateFrom.text, _dateTo.text);

                      /////////// Specialization FUNCTION ///////////////////////////////////////////////////
                      if (fac == null &&
                          pro == null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataSpecializationBatch(spa, bat);

                      if (fac == null &&
                          pro == null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataSpecializationName(spa, _eventName.text);

                      if (fac == null &&
                          pro == null &&
                          spa != null &&
                          bat == null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataSpecializationDate(
                            spa, _dateFrom.text, _dateTo.text);

                      if (fac == null &&
                          pro == null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataSpecializationBatchName(
                            spa, bat, _eventName.text);

                      if (fac == null &&
                          pro == null &&
                          spa != null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataSpecializationBatchDate(
                            spa, bat, _dateFrom.text, _dateTo.text);

                      /////////// Batch FUNCTION ///////////////////////////////////////////////////
                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isEmpty)
                        getDataBatchName(bat, _eventName.text);

                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataBatchDate(bat, _dateFrom.text, _dateTo.text);

                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataBatchNameDate(
                            bat, _eventName.text, _dateFrom.text, _dateTo.text);

                      /////////// Name FUNCTION ///////////////////////////////////////////////////
                      if (fac == null &&
                          pro == null &&
                          spa == null &&
                          bat != null &&
                          _eventName.text.isNotEmpty &&
                          _dateFrom.text.isNotEmpty)
                        getDataNameDate(
                            _eventName.text, _dateFrom.text, _dateTo.text);
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
                      _eventName.clear();
                    },
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          //  ListBuilderFilter(dynamicList: List<dynamic> []),
          ListView.builder(
            itemCount: searchList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.all(5),
                child: Card(
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            "assets/images/main.jpg",
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "${searchList[index].newsAndEventsName}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${searchList[index].dateFrom}",
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              "${searchList[index].facultyNo}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonBar(
                        children: [
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                    child: AlertDialog(
                                      title: Text(
                                        "${searchList[index].newsAndEventsName}",
                                        style: TextStyle(
                                            color: Colors.blueGrey[700],
                                            fontSize: 15),
                                      ),
                                      content: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/images/main.jpg",
                                              height: 120,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(height: 5.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "From at ${searchList[index].dateFrom} To ${searchList[index].dateTo}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                                SizedBox(width: 5.0),
                                                Text(
                                                  "Start at ${searchList[index].newsAndEventsTimeFrom} To ${searchList[index].newsAndEventsTimeTo}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "${searchList[index].newsAndEventsDescription}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                          ],
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
                              "Details",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                              ),
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
    );
  }
}
