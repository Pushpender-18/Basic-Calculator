class KeyData {
  int index = 0;
  final data = [
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    '.',
    '0',
    '/',
    '=',
  ];

  get value {
    String d = data[index];
    index++;
    index %= data.length;
    return d;
  }

  get length {
    return data.length;
  }
}
