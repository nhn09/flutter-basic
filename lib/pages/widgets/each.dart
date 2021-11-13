import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  static String? title = "muhaha";
  static void settext(String text) {
    title = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.book), SizedBox(width: 10), Text("Details")],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(fontSize: 19, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
