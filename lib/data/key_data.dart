class KeyConfig {
  const KeyConfig({required this.name, required this.color});
  final String name;
  final int color;
}

class KeyData {
  int index = 0;
  final data = [
    const KeyConfig(name: 'AC', color: 1),
    const KeyConfig(name: 'C', color: 1),
    const KeyConfig(name: '.', color: 1),
    const KeyConfig(name: '/', color: 1),
    const KeyConfig(name: '7', color: 0),
    const KeyConfig(name: '8', color: 0),
    const KeyConfig(name: '9', color: 0),
    const KeyConfig(name: 'X', color: 1),
    const KeyConfig(name: '4', color: 0),
    const KeyConfig(name: '5', color: 0),
    const KeyConfig(name: '6', color: 0),
    const KeyConfig(name: '-', color: 1),
    const KeyConfig(name: '1', color: 0),
    const KeyConfig(name: '2', color: 0),
    const KeyConfig(name: '3', color: 0),
    const KeyConfig(name: '+', color: 1),
    const KeyConfig(name: '()', color: 0),
    const KeyConfig(name: '0', color: 0),
    const KeyConfig(name: ')', color: 0),
    const KeyConfig(name: '=', color: 2),
  ];

  get value {
    KeyConfig d = data[index];
    index++;
    index %= data.length;
    return d;
  }

  get length {
    return data.length;
  }
}
