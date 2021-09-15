import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFView extends StatefulWidget {
  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exam PDF",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        centerTitle: true,
      ),
      body: Center(
        child:
            PDF().cachedFromUrl('http://africau.edu/images/default/sample.pdf'),
      ),
    );
  }
}
