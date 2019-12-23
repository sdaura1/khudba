import 'dart:convert';

class Khudba {
  int id;
  int uuid;
  int reading_time;
  String created_at;
  String published_at;
  String title;

  Khudba();

  Khudba.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'];
    uuid = jsonMap['uuid'];
    created_at = jsonMap['created_at'];
    published_at = jsonMap['published_at'];
    title = jsonMap['title'];
    reading_time = jsonMap['reading_time'];
  }
}
