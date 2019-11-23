import 'tables.dart';
import 'profiles.dart';

dynamic _findRule(List<List<dynamic>> table, String character) {
  var code = character.codeUnitAt(0);
  var lo = 0;
  var hi = table.length;

  while (lo < hi) {
    var m = ((lo + hi) / 2).floor();
    var rule = table[m];
    if (code < rule[0]) {
      hi = m;
    } else if (code > rule[1]) {
      lo = m + 1;
    } else {
      return rule;
    }
  }

  return null;
}

// Are any characters in the string subject to a rule in the table?
bool _someRule(List<List<dynamic>> table, String string) {
  return string.split('').any((character) {
    return _findRule(table, character) != null;
  });
}

String _substituteString(List<List<dynamic>> table, String string) {
  return string.split('').map((character) {
    var rule = _findRule(table, character);
    return rule ? rule[2] : character;
  }).join('');
}

// operation
// ---------
// 0 - op code
// 1 - target table or null
// 2 and on - additional arugments

String _applyOperation(List<String> operation, String string) {
  var table = operation[1] != null ? tables[operation[1]] : null;
  switch (operation[0]) {
    case 'map':
      return _substituteString(table, string);
    case 'prohibit':
      if (_someRule(table, string)) {
        throw 'stringprep contains prohibited';
      }
      return string;
    case 'unassigned':
      if (_someRule(table, string)) {
        throw 'stringprep contains unassigned';
      }
      return string;
    default:
      return string;
  }
}

stringprep(String profile, String string) {
  return profiles[profile].fold(string, (String str, List<String> operation) {
    return _applyOperation(operation, str);
  });
}

typedef String STRPREPFUNC(String str);

Map<String, STRPREPFUNC> preps = new Map<String, STRPREPFUNC>()
  ..addEntries(profileNames.map((profileName) =>
      new MapEntry(profileName, (String str) => stringprep(profileName, str))));
