
class Khudba {
  int id;
  int uuid;
  int readingTime;
  String createdAt;
  String publishedAt;
  String title;

  Khudba();

  Khudba.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'];
    uuid = jsonMap['uuid'];
    createdAt = jsonMap['created_at'];
    publishedAt = jsonMap['published_at'];
    title = jsonMap['title'];
    readingTime = jsonMap['reading_time'];
  }
}
