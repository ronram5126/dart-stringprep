import 'tables.dart';
import 'profiles.dart';

List<dynamic> _findRule(List<List<dynamic>> table, String character) {
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
    return rule != null && rule.length >= 2 ? rule[2] : character;
  }).join('');
}

// operation
// ---------
// 0 - op code
// 1 - target table or null
// 2 and on - additional arugments

String _applyOperation(List<String> operation, String str) {
  var table = null;

  if (operation != null && operation.length >= 2 && operation[1] != null) {
    table = tables[operation[1]];
  }

  switch (operation[0]) {
    case 'map':
      return _substituteString(table, str);
    case 'prohibit':
      if (_someRule(table, str)) {
        throw 'stringprep contains prohibited';
      }
      return str;
    case 'unassigned':
      if (_someRule(table, str)) {
        throw 'stringprep contains unassigned';
      }
      return str;
    default:
      return str;
  }
}

stringprep(String profile, String string) {
  var _profile = profiles[profile];
  return _profile.fold(string, (String str, List<String> operation) {
    return _applyOperation(operation, str);
  });
}

typedef String STRPREPFUNC(String str);

Map<String, STRPREPFUNC> preps = Map<String, STRPREPFUNC>()
  ..addEntries(profileNames.map((profileName) =>
      MapEntry(profileName, (String str) => stringprep(profileName, str))));
