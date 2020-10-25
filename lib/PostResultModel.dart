import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResultModel{
  String name;
  String job;
  String id;
  String createdAt;

  PostResultModel({this.name, this.job, this.id, this.createdAt});

  factory PostResultModel.createPostResult(Map<String, dynamic> object){
    return PostResultModel(
      name:object['name'],
      job:object['job'],
      id:object['id'],
      createdAt:object['createdAt']
    );
  }

  static Future<PostResultModel> callApiPost(String name, String job) async{
    String apiRuls = "https://reqres.in/api/users";
    var response = await http.post(apiRuls, body: {
      "name" : name,
      "job" : job
    });

    var jsonObject = json.decode(response.body);

    return PostResultModel.createPostResult(jsonObject);
  }
}