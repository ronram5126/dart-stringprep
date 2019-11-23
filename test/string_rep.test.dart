import "package:test/test.dart";
import '../lib/string_prep.dart';

void main() {
  var nodeprep = preps["nodeprep"];
  var nameprep = preps["nameprep"];

  group('nodeprep', () {
    test('examples from http://josefsson.org/idn.php', () {
      assert("libraryh3lp" == nodeprep("libraryH3LP"));
      assert("räksmörgås.josefsson.org" == nodeprep("räksmörgås.josefßon.org"));
    });
  });

  group('nameprep', () {
    test('examples from http://josefsson.org/idn.php', () {
      assert("bigbad" == nameprep("BigBad"));
      assert(
          "安室奈美恵-with-super-monkeys" == nameprep("安室奈美恵-with-SUPER-MONKEYS"));
      assert("미술" == nameprep("미술")); // Korean
      assert("ليهمابتكلموشعربي؟" == nameprep("ليهمابتكلموشعربي؟")); // Egyptian
      assert("他们为什么不说中文" == nameprep("他们为什么不说中文")); // Chinese
      assert("למההםפשוטלאמדבריםעברית" ==
          nameprep("למההםפשוטלאמדבריםעברית")); // Hebrew
      assert("почемужеонинеговорятпорусски" ==
          nameprep("почемужеонинеговорятпорусски")); // Russian
      assert("tạisaohọkhôngthểchỉnóitiếngviệt" ==
          nameprep("TạisaohọkhôngthểchỉnóitiếngViệt")); // Vietnamese
      assert("ひとつ屋根の下2" == nameprep("ひとつ屋根の下2")); // Japanese
      assert("pročprostěnemluvíčesky" ==
          nameprep("Pročprostěnemluvíčesky")); // Czech
      assert("यहलोगहिन्दीक्योंनहींबोलसकतेहैं" ==
          nameprep("यहलोगहिन्दीक्योंनहींबोलसकतेहैं")); // Hindi
      assert("ພາສາລາວ" == nameprep("ພາສາລາວ")); // Lao
      assert("bonġusaħħa" == nameprep("bonġusaħħa")); // Maltese
      assert("ελληνικά" == nameprep("ελληνικά")); // Greek
    });
  });

  test("String.split() splits the string on the delimiter", () {
    var string = "foo,bar,baz";
    expect(string.split(","), equals(["foo", "bar", "baz"]));
  });

  test("String.trim() removes surrounding whitespace", () {
    var string = "  foo ";
    expect(string.trim(), equals("foo"));
  });
}
