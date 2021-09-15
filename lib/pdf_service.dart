import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PDFService {
  static final String PDF_URL = "http://www.africau.edu/images/default/sample.pdf";

  static Future<String> loadPDF() async{
    var response = await http.get(PDF_URL);

    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + '/data.pdf');

    await file.writeAsBytes(response.bodyBytes, flush: true);

    return file.path;
  }
}