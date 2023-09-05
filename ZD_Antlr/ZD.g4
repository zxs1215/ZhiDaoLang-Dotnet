grammar ZD;

program : (statement);

statement : (importer*|namespace? | class ? | access*);

importer : '引·' '【' IDENTIFIER '】' ;

namespace : '【' IDENTIFIER '·书' '】' ;

class : '【' IDENTIFIER'·章' '】'   (property|func) ;

property :  IDENTIFIER '者·' IDENTIFIER '也·'  '。';

access : IDENTIFIER ('·匿之'|'·传之') '。';

func : '【' IDENTIFIER '·' IDENTIFIER '】' '。' ;

KEY : ('引·'|'·书'|'·章'|'设·'|'为·')  ;

IDENTIFIER: [\u4E00-\u9FA5]+([\u4E00-\u9FA5]|[0-9]|'-')+;

WS : [ \t\r\n]+ -> skip ;         