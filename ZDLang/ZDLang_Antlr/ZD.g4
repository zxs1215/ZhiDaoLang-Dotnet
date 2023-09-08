grammar ZD;

program : (statement);

statement : (importer*  namespace?   class   access* );

importer : '\u00B7\u5f15' '\u300a'  IDENTIFIER ('-' IDENTIFIER)* '\u300b' ;

namespace : '\u300a' IDENTIFIER '\u00B7\u4e66' '\u300b';   


class : '\u300a' IDENTIFIER'\u00B7\u7ae0' '\u300b' (property | func) *;

property : IDENTIFIER '\u00B7\u8005' IDENTIFIER '\u00B7\u4e5f' '\uff1b';

valueSentence : (var | new | NUMBER | char | str | func_call);

func_call : IDENTIFIER ('-' IDENTIFIER)* '\u00B7\u4ee5' '\uff08' valueSentence? ( '\uff0c' valueSentence)* '\uff09';

sentence : ((func_call '\uff1b') | set_val | property);

set_val : '\u00B7\u8bbe' IDENTIFIER '\u00B7\u4e3a' valueSentence '\uff1b';

var : IDENTIFIER;

char : '\u2018' ~'’'? '\u2019';

str : '\u201c' ~'”'*? '\u201d';

new : '\u00B7\u94b8' IDENTIFIER;

access : IDENTIFIER ('\u00B7\u533f' | '\u00B7\u4f20') '\uff1b';

func : IDENTIFIER '\u00B7\u66f0' params (sentence)* '\u3002';

params : ('\u00B7\u4ecb' property)*;

KEY : ('\u00B7\u5f15' | '\u00B7\u4e66' | '\u00B7\u7ae0' | '\u00B7\u8bbe' | '\u00B7\u4e3a' | '\u00B7\u5b57' | '\u00B7\u53e5');

IDENTIFIER : CHINESE+ (CHINESE | [0-9])*;

WS : [ \t\r\n]+ -> skip;

NUMBER : [-+]? DIGIT('.' DIGIT)? ([eE] [-+]? DIGIT)?;

fragment DIGIT : ('0' .. '9')+;

fragment CHINESE : [\u4e00-\u9fff]|[a-z];

// 中文的编码表
 // '《'："\u300a"    '》'："\u300b"   书：\u4e66 ''：""
/*
中文符号 ''：""
中文符号 '，'："\uff0c"
中文符号 ';'："\uff1b"
中文符号 '‘'："\u2018"
中文符号 '’'："\u2019"
中文符号 '“'："\u201c"
中文符号 '”'："\u201d"
中文符号 '《'："\u300a"
中文符号 '》'："\u300b"
中文符号 '。'："\u3002"
中文符号 '（'："\uff08"
中文符号 '）'："\uff09"
设：\u8bbe
者：\u8005
为：\u4e3a
以：\u4ee5
书：\u4e66
章：\u7ae0
铸：\u94b8
匿：\u533f
传：\u4f20
引：\u5f15
字：\u5b57
句：\u53e5
曰: \u66f0
 */

