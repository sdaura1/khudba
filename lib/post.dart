import 'package:khudba/khudba_model.dart';

class Post {
  List<Khudba> list;

  Post();

  Post.fromJSON(Map<String, dynamic> jsonMap) {
    list = jsonMap['posts'];
  }
}
