// 集合在Dart中无序，并且每个元素具有唯一性
// 因为它是无序的，因此你不能像List那样用索引来访问元素

void main() {
  var ingredients = new Set();

  ingredients.addAll(['gold', 'titanium', 'xenon']);
  print(ingredients.length == 3);

  // 添加已存在的元素无效
  ingredients.add('gold');
  print(ingredients.length == 3);

  // 删除元素
  ingredients.remove('gold');
  print(ingredients.length == 2);

  // 检查在Set中是否包含某个元素
  print(ingredients.contains('titanium'));

  // 检查在Set中是否包含多个元素
  print(ingredients.containsAll(['titanium', 'xenon']));
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // 获取两个集合的交集
  var nobleGases = new Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  print(intersection.length == 1);
  print(intersection.contains('xenon'));

  // 检查一个Set是否是另一个Set的子集
  var allElements = ['hydrogen', 'helium', 'lithium', 'beryllium',
  'gold', 'titanium', 'xenon'];
  print(ingredients.isSubsetOf(allElements)); // 报错，不存在该方法
}