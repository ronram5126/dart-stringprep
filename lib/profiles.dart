// profile
// -------
// A profile is a list of operations.

final Map<String, List<List<String>>> profiles = {
  "nodeprep": [
    ['map', 'rfc3454-B_1'],
    ['map', 'rfc3454-B_2'],
    ['nfkc'],
    ['prohibit', 'rfc3454-C_1_1'],
    ['prohibit', 'rfc3454-C_1_2'],
    ['prohibit', 'rfc3454-C_2_1'],
    ['prohibit', 'rfc3454-C_2_2'],
    ['prohibit', 'rfc3454-C_3'],
    ['prohibit', 'rfc3454-C_4'],
    ['prohibit', 'rfc3454-C_5'],
    ['prohibit', 'rfc3454-C_6'],
    ['prohibit', 'rfc3454-C_7'],
    ['prohibit', 'rfc3454-C_8'],
    ['prohibit', 'rfc3454-C_9'],
    ['prohibit', 'nodeprep-prohibit'],
    ['bidi'],
    ['bidi-prohibit', 'rfc3454-C_8'],
    ['bidi-ral', 'rfc3454-D_1'],
    ['bidi-l', 'rfc3454-D_2'],
    ['unassigned', 'rfc3454-A_1']
  ],
  "nameprep": [
    ['map', 'rfc3454-B_1'],
    ['map', 'rfc3454-B_2'],
    ['nfkc'],
    ['prohibit', 'rfc3454-C_1_2'],
    ['prohibit', 'rfc3454-C_2_2'],
    ['prohibit', 'rfc3454-C_3'],
    ['prohibit', 'rfc3454-C_4'],
    ['prohibit', 'rfc3454-C_5'],
    ['prohibit', 'rfc3454-C_6'],
    ['prohibit', 'rfc3454-C_7'],
    ['prohibit', 'rfc3454-C_8'],
    ['prohibit', 'rfc3454-C_9'],
    ['bidi'],
    ['bidi-prohibit', 'rfc3454-C_8'],
    ['bidi-ral', 'rfc3454-D_1'],
    ['bidi-l', 'rfc3454-D_2'],
    ['unassigned', 'rfc3454-A_1']
  ],
  "resourceprep": [
    ['map', 'rfc3454-B_1'],
    ['nfkc'],
    ['prohibit', 'rfc3454-C_1_2'],
    ['prohibit', 'rfc3454-C_2_1'],
    ['prohibit', 'rfc3454-C_2_2'],
    ['prohibit', 'rfc3454-C_3'],
    ['prohibit', 'rfc3454-C_4'],
    ['prohibit', 'rfc3454-C_5'],
    ['prohibit', 'rfc3454-C_6'],
    ['prohibit', 'rfc3454-C_7'],
    ['prohibit', 'rfc3454-C_8'],
    ['prohibit', 'rfc3454-C_9'],
    ['bidi'],
    ['bidi-prohibit', 'rfc3454-C_8'],
    ['bidi-ral', 'rfc3454-D_1'],
    ['bidi-l', 'rfc3454-D_2'],
    ['unassigned', 'rfc3454-A_1']
  ],
  'nodeprep-prohibit': "\"&'/:<>@".split('').map((character) {
    var code = character.codeUnitAt(0);
    return [code, code, ''];
  })
};

final List<String> profileNames = [
  "nodeprep",
  "nameprep",
  "resourceprep",
  'nodeprep-prohibit'
];
