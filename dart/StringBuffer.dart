void main() {
  StringBuffer sb = new StringBuffer();

  sb.write("Use a StringBuffer ");
  sb.writeAll(['for ', 'efficient ', 'string ', 'creation ']);
  sb..write('if you are ')..write('building lots of string.');

  print(sb.toString());

  sb.clear();
}