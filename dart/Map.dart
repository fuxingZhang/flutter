// 映射，也有人称之为字典
// Map是一个无序的键值对容器
void main() {
  // Map的声明
  var hawaiianBeaches = {
      'oahu' : ['waikiki', 'kailua', 'waimanalo'],
      'big island' : ['wailea bay', 'pololu beach'],
      'kauai' : ['hanalei', 'poipu']
  };
  var searchTerms = new Map();

  // 指定键值对的参数类型
  var nobleGases = new Map<int, String>();

  // Map的赋值，中括号中是Key，这里可不是数组
  nobleGases[54] = 'dart';

  //Map中的键值对是唯一的
  //同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  nobleGases[54] = 'xenon';
  print(nobleGases[54] == 'xenon');

  // 检索Map是否含有某Key
  print(nobleGases.containsKey(54));

  //删除某个键值对
  nobleGases.remove(54);
  print(nobleGases.containsKey(54));

  var keys = hawaiianBeaches.keys;
  print(keys);
  print(keys.length == 3);
  print(new Set.from(keys).contains('oahu'));

  var values = hawaiianBeaches.values;
  print(values.length == 3);

  //迭代器中有一个有意思的函数any，用来检测迭代器中的数据
  //当其中一个元素运行函数时return true，那么any的返回值就为true，否则为false
  //与之相对的是函数every，要所有函数运行函数return true，那么every返回true
  print(values.any((v) => v.indexOf('waikiki') != -1));

  // 你可以用foreach来遍历数据，但记住它是无序的
  hawaiianBeaches.forEach((k,v) {
    print('I want to visit $k and swim at $v');
  });

  //检索是否包含某个Key或Value
  print(hawaiianBeaches.containsKey('oahu'));
  print(!hawaiianBeaches.containsKey('florida'));

  //V putIfAbsent(K key, Function V ifAbsent())函数，通过Key来查找Value
  //当某个Key不存在的时候，会执行第二参数的Function来添加Value
  var teamAssignments = {};
  teamAssignments.putIfAbsent('Catcher', () => 'Catcher'.length);
  print(teamAssignments);
}