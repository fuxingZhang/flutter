void main() {
    // 使用List的构造函数，也可以添加int参数，表示List固定长度
    var vegetables = new List();

    // 或者简单的用List来赋值
    var fruits = ['apples', 'oranges'];

    // 添加元素
    fruits.add('kiwis');

    // 添加多个元素
    fruits.addAll(['grapes', 'bananas']);

    // 获取List的长度
    print(fruits.length == 5);

    // 利用索引获取元素
    print(fruits[0] == 'apples');

    // 查找某个元素的索引号
    print(fruits.indexOf('apples') == 0);

    // 利用索引号删除某个元素
    var appleIndex = fruits.indexOf('apples');
    fruits.removeAt(appleIndex);
    print(fruits.length == 4);

    // 删除所有的元素
    fruits.clear();
    print(fruits.length == 0);

    print('2222');

    // 你可以使用sort()对List的元素进行排序
    // 并且必须制定比较两个对象的函数，函数的返回值中
    fruits = ['bananas', 'apples', 'oranges'];

    fruits.sort((a, b) => a.compareTo(b));
    print(fruits[0] == 'apples');

    var newFruits = new List<String>();

    newFruits.add('apples');
    var fruit = newFruits[0];
    print(fruit is String);

    newFruits.add(5); // 错误: 在checked mode中会抛出异常 (VSCODE提示，但运行没有报错)
    print(newFruits);
}