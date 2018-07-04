//dart: 前缀表示Dart的标准库，如dart:io、dart:html
import 'dart:math';

//当然，你也可以用相对路径或绝对路径的dart文件来引用
import './class.dart';
// 当各个库有命名冲突的时候，可以使用as关键字来使用命名空间
import './class.dart' as P;

import './library.dart';

//show关键字可以显示某个成员（屏蔽其他）
// import './class.dart' show Point; 

//hide关键字可以隐藏某个成员（显示其他）
// import './class.dart' hide Point; 

//Pub包管理系统中有很多功能强大、实用的库，可以使用前缀 package:
// import 'package:args/args.dart';

// import 'lib/student/student.dart' as Stu;

// import 'lib/student/student.dart' show Student, Person;

// import 'lib/student/student.dart' hide Person;

void main() {
  var p1 = new Point(1, 2, 3);
  var p2 = new Point.fromeList([1, 2, 3]);
  print(p1);//默认调用toString()函数
  print(p2);
  print(ImmutablePoint);
  print(Point);

  // as
  var p3 = new P.Point(1, 2, 3);
  var p4 = new P.Point.fromeList([1, 2, 3]);
  print(p3);//默认调用toString()函数
  print(p4);
  print(P.ImmutablePoint);
  print(P.Point);

  print(Student);
}