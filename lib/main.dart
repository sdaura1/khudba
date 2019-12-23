import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'khudba_model.dart';

Future<Stream<Khudba>> getKhudba() async {
  final String url =
      "https://www.huduba.tk/ghost/api/v3/content/posts/?key=249d66aa2f514031c7e0bf11eb";
  final my_client = new http.Client();
  final streamRest = await my_client.send(http.Request('get', Uri.parse(url)));

  print(streamRest);
  return streamRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => data)
      .expand((data) => (data as List))
      .map((data) {
        return Khudba.fromJSON(data);
      });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khudba App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Khudba'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<Khudba> streamController;
  List<Khudba> khudbas = <Khudba>[];

  @override
  void initState() {
    super.initState();
    listenForKhudba();
  }

  listenForKhudba() async {
    final Stream<Khudba> stream = await getKhudba();
    stream.listen((Khudba _khudba) {
      setState(() {
        khudbas.add(_khudba);
      });
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: khudbas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              subtitle: Text(khudbas[index].id.toString()),
              title: Text(khudbas[index].title),
            );
          },
        ),
      ),
    );
  }

  Widget _makeElementIndex(int index) {
    if (index >= khudbas.length) {
      return null;
    }
    return Container(
      padding: EdgeInsets.all(5.0),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(khudbas[index].title),
              subtitle: Text(khudbas[index].id.toString()),
            )
          ],
        ),
      ),
    );
  }
}
