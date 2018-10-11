void main() {
  var n = 0;
  while(n < 3){
    print('while: ${n++}');
  }

  print('n: $n');
 
  do{
    print('do while: ${--n}');
  } while(n != 0);

  while(n < 3){
    print('while: ${++n}');
  }
}