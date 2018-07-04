void main() {
    var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      print('CLOSED');
      break;
    case 'OPEN':
    case 'NOW_OPEN':
      print('OPEN');
      break;
    default:
      print('Default');
  }

  command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print('CLOSED');
      continue nowClosed; // Continues executing at the nowClosed label.
    case 'OPEN':
      print('OPEN');
      break;
    nowClosed: // Runs for both CLOSED and NOW_CLOSED.
    case 'NOW_CLOSED':
      print('NOW_CLOSED');
      break;
  }
}