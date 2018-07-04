/**
 * 在Dart中类和接口是统一的，类就是接口
 * 如果你想重写部分功能，那么你可以继承一个类
 * 如果你想实现某些功能，那么你也可以实现一个类
 * 
 * 使用abstract关键字来定义抽象类，并且抽象类不能被实例化
 * 抽象方法不需要关键字，直接以分号 ; 结束即可
 */

abstract class Shape { // 定义了一个 Shape 类/接口
    num perimeter(); // 这是一个抽象方法，不需要abstract关键字，是隐式接口的一部分。
}

class Rectangle implements Shape { // Rectangle 实现了 Shape 接口
    final num height, width; 
    Rectangle(num this.height, num this.width);  // 紧凑的构造函数语法
    num perimeter() => 2*height + 2*width;       // 实现了 Shape 接口要求的 perimeter 方法
}

class Square extends Rectangle { // Square 继承 Rectangle
    Square(num size) : super(size, size); // 调用超类的构造函数
}

void main() {
  final square = new Square(2);
  print(square);
  print(square.height);
  print(square.width);
  print(square.perimeter());
}