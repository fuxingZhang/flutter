String sayHello(String name)
{
  return 'Hello $name!';
}

sayHi(name) => 'Hi $name!';

var  sayName = (name)=>'My name is $name!';

typedef int Add(int a, int b);
int Substract(int a, int b) => a - b;

Function makeSubstract(num n)
{
  return (num i) => n - i;
}

FunX(a, {b, c:3, d:4, e})
{
  print('$a $b $c $d $e');
}

FunY(a, [b, c=3, d=4, e])
{
  print('$a $b $c $d $e');
}

void main () {
  //is  is!操作符判断对象是否为指定类型，如num、String等
  assert(sayHello is Function);
  print(sayHello is Function);
  print(sayHello('zfx'));
  print(sayHi('zfx'));
  print(sayName('zfx'));
  print(Substract is Function);
  print(Substract is Add);
  print(Substract(2, 3));
  print(0.1 + 0.2);  // 0.30000000000000004
  var x = makeSubstract(5);
  print(x(2));
  var arr = [];
  for (var i = 0;i < 3; i++) {
    // 在列表 callbacks 中添加一个函数对象，这个函数会记住 for 循环中当前 i 的值。
    arr.add(() => print('Save $i')); 
  }
  arr.forEach( (c) => c() ); // 分别输出 0 1 2
  
  FunX(1, b:3, d:5);
  FunY(1, 3, 5);
}
