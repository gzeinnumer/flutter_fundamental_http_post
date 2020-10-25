import 'package:flutter/material.dart';
import 'package:flutter_fundamental_http_post/PostResultModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResultModel postResultModel = null;
  String msg = "Hasil akan ada disini";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api Demo POST"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Request(https://reqres.in/api/users)"),
              Text('{"name": "morpheus","job": "leader"}'),
              Text("Hasil"),
              Text(
                (PostResultModel != null) ? msg : "Response",
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  PostResultModel.callApiPost("morpheus", "leader")
                      .then((value) {
                    postResultModel = value;
                    setState(() {
                      msg = '{"name" : "' +
                          postResultModel.name +
                          '", "job" : "' +
                          postResultModel.job +
                          '" , "id" : "' +
                          postResultModel.id +
                          '", "createdAt" : "' +
                          postResultModel.createdAt +
                          '"}';
                    });
                  });
                },
                child: Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
