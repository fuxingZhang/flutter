void main() {
  try {
    throw 'This a Exception!';
  } on Exception catch(e) {
    print('Unknown exception: $e');
  } catch(e) {
    print('Unknown type: $e');
  }

  try {
    throw new Exception('值必须大于0！');
  } on Exception catch(e) {
    print('Unknown exception: $e');
  } catch(e) {
    print('Unknown type: $e');
  }

  try {
    throw 'This a Exception!';
  } catch(e) {//可以试试删除catch语句，只用try...finally是什么效果
    print('Catch Exception: $e');
  } finally {
    print('Close');
  }
}