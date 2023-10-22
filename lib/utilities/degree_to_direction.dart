String degToCompass(var num) {
  final int val = ((num / 22.5) + .5).toInt() as int;
  final List<String> arr = <String>[
    'N⬆',
    'N-NE🔄',
    'NE⬈⬈',
    'E-NE🔄',
    'E🡺',
    'E-SE🔄',
    'SE⬊⬊',
    'S-SE🔄',
    'S⬇',
    'S-SW🔄',
    'SW⬋⬋',
    'W-SW🔄',
    '⬅W',
    'W-NW🔄',
    'NW⬉⬉',
    'N-NW🔄'
  ];
  return arr[(val % 16)];
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
