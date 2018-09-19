import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './article.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.tab}) : super(key: key);
  final tab;
  @override
  _HomePageState createState() => new _HomePageState(tab: this.tab);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({Key key, this.tab});

  final tab;

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

    String dataURL = "https://cnodejs.org/api/v1/topics?page=1&tab=$tab&limit=10&mdrender=false";
    http.Response response = await http.get(dataURL).catchError((err) {
      print(err);
      result.add(new Text('server response $err'));
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final _biggerFont = const TextStyle(fontSize: 18.0);
      print(data['success']);
      if (data['success'] == true) {
        // print(data['data']);
        // print(data['data'][0]);
        print(data['data'][0]['title']);
        data['data'].forEach((article) {
          print(article['title']);
          // result.add(new Text(article['title']));
          // result.add(new Text(article['content']));
          result.add(new ListTile(
            title: new Text(
              article['title'],
              style: _biggerFont,
            ),
            // trailing: Image.network(
            //   article['author']['avatar_url']
            // ),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                return new Article(id: article['id']);
              }));
            })
          );
        });
      } else {
        result.add(new Text('server response ${data['success']}'));
      }
    } else {
      result.add(new Text('response statusCode ${response.statusCode}'));
    }

    if (this.mounted){
      setState(() {
        // topics.clear();
        topics = result;
      });
    }
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
