// loop
void main () {
  //for
  for(int i = 0; i<3; i++) {
    print('for: ${i}');
  }

  // forEach
  var collection = [0, 1, 2];
  collection.forEach((x) => print('forEach: $x'));

  // for in
  for(var x in collection) {
    print('for in: $x');
  }

}