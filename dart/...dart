class Person {
  String name;
  String country;
  void setCountry(String country){
    this.country = country;
  }
  String toString() => 'Name:$name\nCountry:$country';
}

void main () {
  // 当你要对一个单一的对象进行一系列的操作的时候，可以使用级联操作符 ..
  Person p = new Person();
  p ..name = 'Wang'
    ..setCountry('China');
  print(p);
}