export './class.dart';

class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y); // 常量构造函数
  static final ImmutablePoint origin = const ImmutablePoint(0, 0); // 创建一个常量对象不能用new，要用const
}

void main() {
  var p1 = new Point(1, 2, 3);
  var p2 = new Point.fromeList([1, 2, 3]);
  print(p1.hashCode);
  print(p1);//默认调用toString()函数
  print(p2);
}

class Point {
  num x;
  num y;
  num z;
  
  Point(this.x, this.y, z) { //第一个值传递给this.x，第二个值传递给this.y
    this.z = z;
  }
  
  Point.fromeList(var list): //命名构造函数，格式为Class.name(var param)
    x = list[0], y = list[1], z = list[2]{//使用冒号初始化变量
  }

  //当然，上面句你也可以简写为：
  //Point.fromeList(var list):this(list[0], list[1], list[2]);
  String toString() => 'x:$x  y:$y  z:$z';
}