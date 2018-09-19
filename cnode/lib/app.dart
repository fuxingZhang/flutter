import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/article.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "cnode by star",
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('cnode'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              // var page;
              // switch (choice.path) {
              //   case 'all':
              //     page = new HomePage();
              //     break;
              //   case 'ask':
              //     page = new AskPage();
              //     break;
              //   default:
              //     page = new HomePage();
              // }
              // print(choice.title);
              return new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new HomePage(tab: choice.path),
              );
            }).toList(),
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/article': (BuildContext context) => new Article(),
      }
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.path});
  final String title;
  final IconData icon;
  final String path;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '全部', path: 'all', icon: Icons.directions_car),
  const Choice(title: '精华', path: 'good', icon: Icons.directions_bike),
  const Choice(title: '分享', path: 'share', icon: Icons.directions_boat),
  const Choice(title: '问答', path: 'ask', icon: Icons.directions_bus),
  const Choice(title: '招聘', path: 'job', icon: Icons.directions_railway)
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
