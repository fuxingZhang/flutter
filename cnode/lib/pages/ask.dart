import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AskPage extends StatefulWidget {
  AskPage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<AskPage> {
  List<Widget> topics = <Widget>[
    Center(
      child: Text('loading')
    )
  ];

  @override
  void initState() {
    super.initState();
    getTopics();
  }

  void getTopics() async {
    List<Widget> result = [];

    String dataURL = "https://cnodejs.org/api/v1/topics?page=1&tab=ask&limit=10";
    http.Response response = await http.get(dataURL).catchError((err) {
      print(err);
      result.add(new Text('server response $err'));
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['success']);
      if (data['success'] == true) {
        // print(data['data']);
        // print(data['data'][0]);
        print(data['data'][0]['title']);
        data['data'].forEach((article) {
          print(article['title']);
          result.add(new Text(article['title']));
        });
      } else {
        result.add(new Text('server response ${data['success']}'));
      }
    } else {
      result.add(new Text('response statusCode ${response.statusCode}'));
    }

    setState(() {
      topics.clear();
      topics = result;
    });
  }

  @override
  Widget build(BuildContext context) { 
    return new ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      children: topics,
    );
  }
}
