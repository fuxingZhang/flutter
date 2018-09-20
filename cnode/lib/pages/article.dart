import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';

class Article extends StatefulWidget {
  Article({Key key, this.id}) : super(key: key);
  final id;

  @override
  _ArticlePageState createState() => new _ArticlePageState(id: this.id);
}

class _ArticlePageState extends State<Article> {
  _ArticlePageState({Key key, this.id});
  final id;

  var title = '';
  var content = 'loding';

  @override
  void initState() {
    super.initState();
    getTopic();
  }

  void getTopic() async {

    String dataURL = "https://cnodejs.org/api/v1/topic/$id?mdrender=false";
    http.Response response = await http.get(dataURL).catchError((err) {
      print(err);
      content = 'err';
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['success']);
      if (data['success'] == true) {
        // print(data['data']);
        // print(data['data'][0]);
        print(data['data']);
        title = data['data']['title'];
        content = data['data']['content'];
      } else {
        content = 'server response ${data['success']}';
      }
    } else {
      content = 'response statusCode ${response.statusCode}';
    }

    setState(() {
      title = title;
      content = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        // body: new Center(
        //   child: new Text(title),
        // ),
        body: new Markdown(data: content)
      ),
    );
  }
}
