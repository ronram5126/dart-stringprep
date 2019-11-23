import 'package:dart_stringprep/string_prep.dart';

var nameprep = preps["nameprep"];

void main() {
  String username = "NonStandardUserName";
  print(nameprep(username));
}
